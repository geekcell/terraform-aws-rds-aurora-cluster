<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the secret. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Friendly name of the new secret. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS Customer Managed Key. | `map(any)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | Username for the secret. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_kms_arn"></a> [kms\_arn](#output\_kms\_arn) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.4 |

## Resources

- resource.aws_secretsmanager_secret.main (modules/db_proxy_secret/main.tf#13)
- resource.aws_secretsmanager_secret_version.main (modules/db_proxy_secret/main.tf#24)
- resource.random_password.password (modules/db_proxy_secret/main.tf#8)
<!-- END_TF_DOCS -->
