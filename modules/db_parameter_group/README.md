<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_family"></a> [family](#input\_family) | The family of the DB parameter group. | `string` | `"aurora8.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the DB parameter group. | `string` | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | The name and Values of the DB parameters. | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "autocommit",<br>    "value": "1"<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS DB Parameter Group. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Resources

- resource.aws_db_parameter_group.main (modules/db_parameter_group/main.tf#1)
<!-- END_TF_DOCS -->
