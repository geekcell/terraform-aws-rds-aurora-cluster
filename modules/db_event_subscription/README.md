<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_categories"></a> [event\_categories](#input\_event\_categories) | A list of event categories for a SourceType that you want to subscribe to. | `list(string)` | <pre>[<br>  "configuration change",<br>  "creation",<br>  "deletion",<br>  "failover",<br>  "failure",<br>  "global-failover",<br>  "maintenance",<br>  "migration",<br>  "notification",<br>  "serverless"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the DB event subscription. | `string` | n/a | yes |
| <a name="input_recipients"></a> [recipients](#input\_recipients) | A list of email addresses to receive events. | `list(string)` | n/a | yes |
| <a name="input_source_ids"></a> [source\_ids](#input\_source\_ids) | A list of identifiers of the event sources for which events will be returned. | `list(string)` | n/a | yes |
| <a name="input_source_type"></a> [source\_type](#input\_source\_type) | The type of source that will be generating the events. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS Proxy. | `map(any)` | `{}` | no |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |

## Resources

- resource.aws_db_event_subscription.main (modules/db_event_subscription/main.tf#1)
<!-- END_TF_DOCS -->
