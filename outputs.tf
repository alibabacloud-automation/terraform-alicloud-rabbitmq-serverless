# RAM User outputs
output "ram_user_name" {
  description = "The name of the RAM user created for AMQP access"
  value       = alicloud_ram_user.ram_user.name
}

output "ram_user_id" {
  description = "The ID of the RAM user"
  value       = alicloud_ram_user.ram_user.id
}

# RAM Access Key outputs
output "ram_access_key_id" {
  description = "The access key ID of the RAM user"
  value       = alicloud_ram_access_key.ram_access_key.id
}

output "ram_access_key_secret" {
  description = "The access key secret of the RAM user"
  value       = alicloud_ram_access_key.ram_access_key.secret
  sensitive   = true
}

# RAM Policy outputs
output "ram_policy_name" {
  description = "The name of the RAM policy for AMQP operations"
  value       = alicloud_ram_policy.ram_policy.policy_name
}

output "ram_policy_id" {
  description = "The ID of the RAM policy"
  value       = alicloud_ram_policy.ram_policy.id
}

# AMQP Instance outputs
output "amqp_instance_id" {
  description = "The ID of the AMQP instance"
  value       = alicloud_amqp_instance.amqp_instance.id
}

output "amqp_instance_name" {
  description = "The name of the AMQP instance"
  value       = alicloud_amqp_instance.amqp_instance.instance_name
}

output "amqp_instance_status" {
  description = "The status of the AMQP instance"
  value       = alicloud_amqp_instance.amqp_instance.status
}

# AMQP Static Account outputs
output "amqp_static_account_username" {
  description = "The username of the AMQP static account"
  value       = alicloud_amqp_static_account.static_account.user_name
}

output "amqp_static_account_password" {
  description = "The password of the AMQP static account"
  value       = alicloud_amqp_static_account.static_account.password
  sensitive   = true
}

# AMQP Virtual Host outputs
output "amqp_virtual_host_name" {
  description = "The name of the AMQP virtual host"
  value       = alicloud_amqp_virtual_host.virtual_host.virtual_host_name
}

output "amqp_virtual_host_id" {
  description = "The ID of the AMQP virtual host"
  value       = alicloud_amqp_virtual_host.virtual_host.id
}

# AMQP Exchange outputs
output "amqp_exchange_name" {
  description = "The name of the AMQP exchange"
  value       = alicloud_amqp_exchange.exchange.exchange_name
}

output "amqp_exchange_id" {
  description = "The ID of the AMQP exchange"
  value       = alicloud_amqp_exchange.exchange.id
}

# AMQP Queue outputs
output "amqp_queue_name" {
  description = "The name of the AMQP queue"
  value       = alicloud_amqp_queue.queue.queue_name
}

output "amqp_queue_id" {
  description = "The ID of the AMQP queue"
  value       = alicloud_amqp_queue.queue.id
}

# AMQP Binding outputs
output "amqp_binding_id" {
  description = "The ID of the AMQP binding"
  value       = alicloud_amqp_binding.binding.id
}

output "amqp_binding_key" {
  description = "The binding key of the AMQP binding"
  value       = alicloud_amqp_binding.binding.binding_key
}

# Convenience outputs
output "rabbitmq_console_url" {
  description = "The URL to access RabbitMQ instance console"
  value       = format("https://amqp.console.aliyun.com/region/%s/instance/%s/instance-detail", data.alicloud_regions.current.regions[0].id, alicloud_amqp_instance.amqp_instance.id)
}