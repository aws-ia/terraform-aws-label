
# Terraform AWS Label Module
The Terraform Amazon Web Services (AWS) Label module generates consistent label names and tags for Terraform resources.

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.68 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 0.9 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account"></a> [account](#input\_account) | account, which could be AWS Account Name or Number | `string` | `null` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | attributes, which could be used for additional attributes | `list(any)` | `[]` | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | delimiter, which could be used between name, namespace and env | `string` | `"-"` | no |
| <a name="input_env"></a> [env](#input\_env) | environment, e.g. 'sit', 'uat', 'prod' etc | `string` | `null` | no |
| <a name="input_id_order"></a> [id\_order](#input\_id\_order) | n/a | `list(any)` | <pre>[<br>  "namespace",<br>  "account",<br>  "env",<br>  "name"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | stack name | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | namespace, which could be your organization name, e.g. amazon | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags, which could be used for additional tags | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account"></a> [account](#output\_account) | n/a |
| <a name="output_env"></a> [env](#output\_env) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_namespace"></a> [namespace](#output\_namespace) | n/a |
| <a name="output_tags"></a> [tags](#output\_tags) | n/a |
| <a name="output_tags_aws"></a> [tags\_aws](#output\_tags\_aws) | n/a |
