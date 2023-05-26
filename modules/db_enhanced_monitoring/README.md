<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the DB Enhanced Monitoring Role. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS Enhanced Monitoring. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Resources

- resource.aws_iam_role.main (modules/db_enhanced_monitoring/main.tf#1)
- resource.aws_iam_role_policy_attachment.main (modules/db_enhanced_monitoring/main.tf#10)
- data source.aws_iam_policy_document.main (modules/db_enhanced_monitoring/data.tf#1)
<!-- END_TF_DOCS -->
