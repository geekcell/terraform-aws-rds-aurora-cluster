<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_scheme"></a> [auth\_scheme](#input\_auth\_scheme) | he type of authentication that the proxy uses for connections from the proxy to the underlying database. | `string` | `"SECRETS"` | no |
| <a name="input_debug_logging"></a> [debug\_logging](#input\_debug\_logging) | Whether the proxy includes detailed information about SQL statements in its logs. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | A user-specified description about the authentication used by a proxy to log in as a specific database user. | `string` | `"Authentication using Username and Password"` | no |
| <a name="input_engine_family"></a> [engine\_family](#input\_engine\_family) | The kinds of databases that the proxy can connect to. | `string` | `"MYSQL"` | no |
| <a name="input_iam_auth"></a> [iam\_auth](#input\_iam\_auth) | Whether to require or disallow AWS Identity and Access Management (IAM) authentication for connections to the proxy. | `string` | `"DISABLED"` | no |
| <a name="input_idle_client_timeout"></a> [idle\_client\_timeout](#input\_idle\_client\_timeout) | The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it. | `number` | `1800` | no |
| <a name="input_name"></a> [name](#input\_name) | The identifier for the proxy. | `string` | n/a | yes |
| <a name="input_rds_cluster_identifier"></a> [rds\_cluster\_identifier](#input\_rds\_cluster\_identifier) | RDS cluster identifier. | `string` | n/a | yes |
| <a name="input_require_tls"></a> [require\_tls](#input\_require\_tls) | A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS Proxy. | `map(any)` | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | A list of maps containing the username for the database user. | `list(string)` | `[]` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | A list of VPC security group IDs to associate with the proxy. | `list(string)` | n/a | yes |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | One or more VPC subnet IDs to associate with the new proxy. | `list(string)` | n/a | yes |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Resources

- resource.aws_db_proxy.main (modules/db_proxy/main.tf#1)
- resource.aws_db_proxy_default_target_group.main (modules/db_proxy/main.tf#29)
- resource.aws_db_proxy_endpoint.read_only (modules/db_proxy/main.tf#47)
- resource.aws_db_proxy_target.main (modules/db_proxy/main.tf#41)
- resource.aws_iam_policy.main (modules/db_proxy/main.tf#59)
- resource.aws_iam_role.main (modules/db_proxy/main.tf#54)
- resource.aws_iam_role_policy_attachment.main (modules/db_proxy/main.tf#64)
- data source.aws_iam_policy_document.assume_role (modules/db_proxy/data.tf#35)
- data source.aws_iam_policy_document.proxy (modules/db_proxy/data.tf#3)
- data source.aws_region.current (modules/db_proxy/data.tf#1)
<!-- END_TF_DOCS -->
