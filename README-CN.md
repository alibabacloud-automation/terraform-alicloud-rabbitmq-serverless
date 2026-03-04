阿里云 RabbitMQ Serverless Terraform 模块

# terraform-alicloud-rabbitmq-serverless

[English](https://github.com/alibabacloud-automation/terraform-alicloud-rabbitmq-serverless/blob/main/README.md) | 简体中文

在阿里云上创建 RabbitMQ serverless 实例和相关资源的 Terraform 模块。该模块实现了[云消息队列 RabbitMQ 实践](https://www.aliyun.com/solution/tech-solution/rabbitmq-serverless)解决方案，提供完整的 serverless 消息队列设置，包括 RAM 用户管理、AMQP 实例配置以及包含虚拟主机、交换机、队列和绑定的消息路由组件。

## 使用方法

该模块创建完整的 RabbitMQ serverless 设置，包括用于访问控制的 RAM 用户、AMQP 实例、虚拟主机、交换机、队列和绑定配置。

```terraform
module "rabbitmq_serverless" {
  source = "alibabacloud-automation/rabbitmq-serverless/alicloud"

  ram_user_config = {
    name = "rabbitmq-user"
  }

  ram_policy_config = {
    policy_name = "rabbitmq-policy"
  }

  amqp_instance_config = {
    instance_name = "my-rabbitmq"
  }

  amqp_virtual_host_config = {
    virtual_host_name = "production-vhost"
  }

  amqp_exchange_config = {
    exchange_name = "orders-exchange"
  }

  amqp_queue_config = {
    queue_name = "orders-queue"
  }

  amqp_binding_config = {
    binding_key = "order.created"
  }
}
```

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-rabbitmq-serverless/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.212.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | >= 1.212.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_amqp_binding.binding](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_binding) | resource |
| [alicloud_amqp_exchange.exchange](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_exchange) | resource |
| [alicloud_amqp_instance.amqp_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_instance) | resource |
| [alicloud_amqp_queue.queue](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_queue) | resource |
| [alicloud_amqp_static_account.static_account](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_static_account) | resource |
| [alicloud_amqp_virtual_host.virtual_host](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/amqp_virtual_host) | resource |
| [alicloud_ram_access_key.ram_access_key](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_access_key) | resource |
| [alicloud_ram_policy.ram_policy](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_policy) | resource |
| [alicloud_ram_user.ram_user](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_user) | resource |
| [alicloud_ram_user_policy_attachment.policy_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_user_policy_attachment) | resource |
| [alicloud_regions.current](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amqp_binding_config"></a> [amqp\_binding\_config](#input\_amqp\_binding\_config) | Configuration for AMQP binding. The binding\_key is required. | <pre>object({<br/>    binding_type = optional(string, "QUEUE")<br/>    binding_key  = string<br/>  })</pre> | n/a | yes |
| <a name="input_amqp_exchange_config"></a> [amqp\_exchange\_config](#input\_amqp\_exchange\_config) | Configuration for AMQP exchange. The exchange\_name is required. | <pre>object({<br/>    exchange_name     = string<br/>    exchange_type     = optional(string, "DIRECT")<br/>    internal          = optional(bool, false)<br/>    auto_delete_state = optional(bool, false)<br/>  })</pre> | n/a | yes |
| <a name="input_amqp_instance_config"></a> [amqp\_instance\_config](#input\_amqp\_instance\_config) | Configuration for AMQP instance. The instance\_name is required. | <pre>object({<br/>    instance_name          = string<br/>    payment_type           = optional(string, "PayAsYouGo")<br/>    serverless_charge_type = optional(string, "onDemand")<br/>    support_eip            = optional(bool, true)<br/>    support_tracing        = optional(bool, true)<br/>  })</pre> | n/a | yes |
| <a name="input_amqp_queue_config"></a> [amqp\_queue\_config](#input\_amqp\_queue\_config) | Configuration for AMQP queue. The queue\_name is required. | <pre>object({<br/>    queue_name        = string<br/>    auto_delete_state = optional(bool, false)<br/>  })</pre> | n/a | yes |
| <a name="input_amqp_virtual_host_config"></a> [amqp\_virtual\_host\_config](#input\_amqp\_virtual\_host\_config) | Configuration for AMQP virtual host. The virtual\_host\_name is required. | <pre>object({<br/>    virtual_host_name = string<br/>  })</pre> | n/a | yes |
| <a name="input_custom_ram_policy_document"></a> [custom\_ram\_policy\_document](#input\_custom\_ram\_policy\_document) | Custom RAM policy document in JSON format. If not provided, default AMQP policy will be used. | `string` | `null` | no |
| <a name="input_ram_access_key_config"></a> [ram\_access\_key\_config](#input\_ram\_access\_key\_config) | Configuration for RAM access key. The status can be 'Active' or 'Inactive'. | <pre>object({<br/>    status = optional(string, "Active")<br/>  })</pre> | <pre>{<br/>  "status": "Active"<br/>}</pre> | no |
| <a name="input_ram_policy_attachment_config"></a> [ram\_policy\_attachment\_config](#input\_ram\_policy\_attachment\_config) | Configuration for RAM policy attachment. Policy type can be 'Custom' or 'System'. | <pre>object({<br/>    policy_type = optional(string, "Custom")<br/>  })</pre> | <pre>{<br/>  "policy_type": "Custom"<br/>}</pre> | no |
| <a name="input_ram_policy_config"></a> [ram\_policy\_config](#input\_ram\_policy\_config) | Configuration for RAM policy. The policy\_name is required. | <pre>object({<br/>    policy_name = string<br/>    description = optional(string, "Policy for AMQP operations")<br/>  })</pre> | n/a | yes |
| <a name="input_ram_user_config"></a> [ram\_user\_config](#input\_ram\_user\_config) | Configuration for RAM user. The name is required. | <pre>object({<br/>    name         = string<br/>    display_name = optional(string, "AMQP User")<br/>    comments     = optional(string, "RAM user for AMQP operations")<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amqp_binding_id"></a> [amqp\_binding\_id](#output\_amqp\_binding\_id) | The ID of the AMQP binding |
| <a name="output_amqp_binding_key"></a> [amqp\_binding\_key](#output\_amqp\_binding\_key) | The binding key of the AMQP binding |
| <a name="output_amqp_exchange_id"></a> [amqp\_exchange\_id](#output\_amqp\_exchange\_id) | The ID of the AMQP exchange |
| <a name="output_amqp_exchange_name"></a> [amqp\_exchange\_name](#output\_amqp\_exchange\_name) | The name of the AMQP exchange |
| <a name="output_amqp_instance_id"></a> [amqp\_instance\_id](#output\_amqp\_instance\_id) | The ID of the AMQP instance |
| <a name="output_amqp_instance_name"></a> [amqp\_instance\_name](#output\_amqp\_instance\_name) | The name of the AMQP instance |
| <a name="output_amqp_instance_status"></a> [amqp\_instance\_status](#output\_amqp\_instance\_status) | The status of the AMQP instance |
| <a name="output_amqp_queue_id"></a> [amqp\_queue\_id](#output\_amqp\_queue\_id) | The ID of the AMQP queue |
| <a name="output_amqp_queue_name"></a> [amqp\_queue\_name](#output\_amqp\_queue\_name) | The name of the AMQP queue |
| <a name="output_amqp_static_account_password"></a> [amqp\_static\_account\_password](#output\_amqp\_static\_account\_password) | The password of the AMQP static account |
| <a name="output_amqp_static_account_username"></a> [amqp\_static\_account\_username](#output\_amqp\_static\_account\_username) | The username of the AMQP static account |
| <a name="output_amqp_virtual_host_id"></a> [amqp\_virtual\_host\_id](#output\_amqp\_virtual\_host\_id) | The ID of the AMQP virtual host |
| <a name="output_amqp_virtual_host_name"></a> [amqp\_virtual\_host\_name](#output\_amqp\_virtual\_host\_name) | The name of the AMQP virtual host |
| <a name="output_rabbitmq_console_url"></a> [rabbitmq\_console\_url](#output\_rabbitmq\_console\_url) | The URL to access RabbitMQ instance console |
| <a name="output_ram_access_key_id"></a> [ram\_access\_key\_id](#output\_ram\_access\_key\_id) | The access key ID of the RAM user |
| <a name="output_ram_access_key_secret"></a> [ram\_access\_key\_secret](#output\_ram\_access\_key\_secret) | The access key secret of the RAM user |
| <a name="output_ram_policy_id"></a> [ram\_policy\_id](#output\_ram\_policy\_id) | The ID of the RAM policy |
| <a name="output_ram_policy_name"></a> [ram\_policy\_name](#output\_ram\_policy\_name) | The name of the RAM policy for AMQP operations |
| <a name="output_ram_user_id"></a> [ram\_user\_id](#output\_ram\_user\_id) | The ID of the RAM user |
| <a name="output_ram_user_name"></a> [ram\_user\_name](#output\_ram\_user\_name) | The name of the RAM user created for AMQP access |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)