provider "alicloud" {
  region = var.region
}

resource "random_id" "suffix" {
  byte_length = 4
}

module "rabbitmq_serverless" {
  source = "../../"

  ram_user_config = {
    name         = var.ram_user_name
    display_name = "RabbitMQ AMQP User"
    comments     = "RAM user for RabbitMQ AMQP operations"
  }

  ram_policy_config = {
    policy_name = var.ram_policy_name
    description = "Policy for RabbitMQ AMQP operations"
  }

  amqp_instance_config = {
    instance_name          = "${var.amqp_instance_name}-${random_id.suffix.hex}"
    payment_type           = "PayAsYouGo"
    serverless_charge_type = "onDemand"
    support_eip            = true
    support_tracing        = true
  }

  amqp_virtual_host_config = {
    virtual_host_name = var.virtual_host_name
  }

  amqp_exchange_config = {
    exchange_name     = var.exchange_name
    exchange_type     = var.exchange_type
    internal          = false
    auto_delete_state = false
  }

  amqp_queue_config = {
    queue_name        = var.queue_name
    auto_delete_state = false
  }

  amqp_binding_config = {
    binding_type = "QUEUE"
    binding_key  = var.binding_key
  }
}
