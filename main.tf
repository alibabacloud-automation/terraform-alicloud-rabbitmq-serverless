# Get current region information
data "alicloud_regions" "current" {
  current = true
}

# Local variables for default RAM policy document
locals {
  # Default RAM policy document for AMQP operations
  default_ram_policy_document = jsonencode({
    Version = "1"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "amqp:*",
          "amqp-open:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Create RAM user for AMQP access
resource "alicloud_ram_user" "ram_user" {
  name         = var.ram_user_config.name
  display_name = var.ram_user_config.display_name
  comments     = var.ram_user_config.comments
}

# Create access key for the RAM user
resource "alicloud_ram_access_key" "ram_access_key" {
  user_name = alicloud_ram_user.ram_user.name
  status    = var.ram_access_key_config.status
}

# Create RAM policy for AMQP operations
resource "alicloud_ram_policy" "ram_policy" {
  policy_name     = var.ram_policy_config.policy_name
  policy_document = var.custom_ram_policy_document != null ? var.custom_ram_policy_document : local.default_ram_policy_document
  description     = var.ram_policy_config.description
}

# Attach policy to user
resource "alicloud_ram_user_policy_attachment" "policy_attachment" {
  user_name   = alicloud_ram_user.ram_user.name
  policy_type = var.ram_policy_attachment_config.policy_type
  policy_name = alicloud_ram_policy.ram_policy.policy_name
}

# Create AMQP instance
resource "alicloud_amqp_instance" "amqp_instance" {
  instance_name          = var.amqp_instance_config.instance_name
  payment_type           = var.amqp_instance_config.payment_type
  serverless_charge_type = var.amqp_instance_config.serverless_charge_type
  support_eip            = var.amqp_instance_config.support_eip
  support_tracing        = var.amqp_instance_config.support_tracing
}

# Create static account for AMQP instance
resource "alicloud_amqp_static_account" "static_account" {
  instance_id = alicloud_amqp_instance.amqp_instance.id
  access_key  = alicloud_ram_access_key.ram_access_key.id
  secret_key  = alicloud_ram_access_key.ram_access_key.secret
}

# Create virtual host
resource "alicloud_amqp_virtual_host" "virtual_host" {
  instance_id       = alicloud_amqp_instance.amqp_instance.id
  virtual_host_name = var.amqp_virtual_host_config.virtual_host_name
}

# Create exchange
resource "alicloud_amqp_exchange" "exchange" {
  instance_id       = alicloud_amqp_instance.amqp_instance.id
  virtual_host_name = alicloud_amqp_virtual_host.virtual_host.virtual_host_name
  exchange_name     = var.amqp_exchange_config.exchange_name
  exchange_type     = var.amqp_exchange_config.exchange_type
  internal          = var.amqp_exchange_config.internal
  auto_delete_state = var.amqp_exchange_config.auto_delete_state
}

# Create queue
resource "alicloud_amqp_queue" "queue" {
  instance_id       = alicloud_amqp_instance.amqp_instance.id
  virtual_host_name = alicloud_amqp_virtual_host.virtual_host.virtual_host_name
  queue_name        = var.amqp_queue_config.queue_name
  auto_delete_state = var.amqp_queue_config.auto_delete_state
}

# Create binding between exchange and queue
resource "alicloud_amqp_binding" "binding" {
  instance_id       = alicloud_amqp_instance.amqp_instance.id
  virtual_host_name = alicloud_amqp_virtual_host.virtual_host.virtual_host_name
  source_exchange   = alicloud_amqp_exchange.exchange.exchange_name
  destination_name  = alicloud_amqp_queue.queue.queue_name
  binding_type      = var.amqp_binding_config.binding_type
  binding_key       = var.amqp_binding_config.binding_key
}
