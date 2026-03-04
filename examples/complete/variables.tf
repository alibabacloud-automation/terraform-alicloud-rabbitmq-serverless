variable "region" {
  type        = string
  description = "The region where resources will be created"
  default     = "cn-hangzhou"
}

variable "ram_user_name" {
  type        = string
  description = "The name of the RAM user for AMQP access"
  default     = "amqp-user-example"
}

variable "ram_policy_name" {
  type        = string
  description = "The name of the RAM policy for AMQP operations"
  default     = "amqp-policy-example"
}

variable "amqp_instance_name" {
  type        = string
  description = "The name of the AMQP instance"
  default     = "rabbitmq-example"
}

variable "virtual_host_name" {
  type        = string
  description = "The name of the virtual host"
  default     = "example-vhost"
}

variable "exchange_name" {
  type        = string
  description = "The name of the exchange"
  default     = "example-exchange"
}

variable "exchange_type" {
  type        = string
  description = "The type of the exchange"
  default     = "DIRECT"
}

variable "queue_name" {
  type        = string
  description = "The name of the queue"
  default     = "example-queue"
}

variable "binding_key" {
  type        = string
  description = "The binding key for routing messages"
  default     = "example-routing-key"
}
