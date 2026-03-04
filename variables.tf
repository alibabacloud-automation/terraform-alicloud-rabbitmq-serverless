variable "ram_user_config" {
  type = object({
    name         = string
    display_name = optional(string, "AMQP User")
    comments     = optional(string, "RAM user for AMQP operations")
  })
  description = "Configuration for RAM user. The name is required."
}

variable "ram_access_key_config" {
  type = object({
    status = optional(string, "Active")
  })
  description = "Configuration for RAM access key. The status can be 'Active' or 'Inactive'."
  default = {
    status = "Active"
  }
}

variable "ram_policy_config" {
  type = object({
    policy_name = string
    description = optional(string, "Policy for AMQP operations")
  })
  description = "Configuration for RAM policy. The policy_name is required."
}

variable "custom_ram_policy_document" {
  type        = string
  description = "Custom RAM policy document in JSON format. If not provided, default AMQP policy will be used."
  default     = null
}

variable "ram_policy_attachment_config" {
  type = object({
    policy_type = optional(string, "Custom")
  })
  description = "Configuration for RAM policy attachment. Policy type can be 'Custom' or 'System'."
  default = {
    policy_type = "Custom"
  }
}

variable "amqp_instance_config" {
  type = object({
    instance_name          = string
    payment_type           = optional(string, "PayAsYouGo")
    serverless_charge_type = optional(string, "onDemand")
    support_eip            = optional(bool, true)
    support_tracing        = optional(bool, true)
  })
  description = "Configuration for AMQP instance. The instance_name is required."
}

variable "amqp_virtual_host_config" {
  type = object({
    virtual_host_name = string
  })
  description = "Configuration for AMQP virtual host. The virtual_host_name is required."
}

variable "amqp_exchange_config" {
  type = object({
    exchange_name     = string
    exchange_type     = optional(string, "DIRECT")
    internal          = optional(bool, false)
    auto_delete_state = optional(bool, false)
  })
  description = "Configuration for AMQP exchange. The exchange_name is required."
}

variable "amqp_queue_config" {
  type = object({
    queue_name        = string
    auto_delete_state = optional(bool, false)
  })
  description = "Configuration for AMQP queue. The queue_name is required."
}

variable "amqp_binding_config" {
  type = object({
    binding_type = optional(string, "QUEUE")
    binding_key  = string
  })
  description = "Configuration for AMQP binding. The binding_key is required."
}
