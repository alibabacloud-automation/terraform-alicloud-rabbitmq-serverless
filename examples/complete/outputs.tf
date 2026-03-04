output "amqp_instance_id" {
  description = "The ID of the AMQP instance"
  value       = module.rabbitmq_serverless.amqp_instance_id
}

output "amqp_instance_name" {
  description = "The name of the AMQP instance"
  value       = module.rabbitmq_serverless.amqp_instance_name
}

output "rabbitmq_console_url" {
  description = "The URL to access RabbitMQ instance console"
  value       = module.rabbitmq_serverless.rabbitmq_console_url
}

output "ram_user_name" {
  description = "The name of the RAM user created for AMQP access"
  value       = module.rabbitmq_serverless.ram_user_name
}

output "ram_access_key_id" {
  description = "The access key ID of the RAM user"
  value       = module.rabbitmq_serverless.ram_access_key_id
}

output "ram_access_key_secret" {
  description = "The access key secret of the RAM user"
  value       = module.rabbitmq_serverless.ram_access_key_secret
  sensitive   = true
}

output "amqp_static_account_username" {
  description = "The username of the AMQP static account"
  value       = module.rabbitmq_serverless.amqp_static_account_username
}

output "amqp_static_account_password" {
  description = "The password of the AMQP static account"
  value       = module.rabbitmq_serverless.amqp_static_account_password
  sensitive   = true
}

output "virtual_host_name" {
  description = "The name of the virtual host"
  value       = module.rabbitmq_serverless.amqp_virtual_host_name
}

output "exchange_name" {
  description = "The name of the exchange"
  value       = module.rabbitmq_serverless.amqp_exchange_name
}

output "queue_name" {
  description = "The name of the queue"
  value       = module.rabbitmq_serverless.amqp_queue_name
}