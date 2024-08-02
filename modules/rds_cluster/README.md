<!-- BEGIN_TF_DOCS -->


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_reader_capacity"></a> [additional\_reader\_capacity](#input\_additional\_reader\_capacity) | The minimum of additional reader capacity in an AWS RDS Cluster. | `number` | `0` | no |
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | The amount of storage in gibibytes (GiB) to allocate to each DB instance in the Multi-AZ DB cluster. | `number` | `null` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_backtrack_window"></a> [backtrack\_window](#input\_backtrack\_window) | The target backtrack window, in seconds. | `number` | `0` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35. | `number` | `35` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The cluster identifier. | `string` | n/a | yes |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy all Cluster tags to snapshots. | `bool` | `true` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name for an automatically created database on cluster creation. | `string` | `null` | no |
| <a name="input_db_cluster_instance_class"></a> [db\_cluster\_instance\_class](#input\_db\_cluster\_instance\_class) | The compute and memory capacity of each DB instance in the Multi-AZ DB cluster. | `string` | `null` | no |
| <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name) | A cluster parameter group to associate with the cluster. | `string` | `null` | no |
| <a name="input_db_instance_parameter_group_name"></a> [db\_instance\_parameter\_group\_name](#input\_db\_instance\_parameter\_group\_name) | Instance parameter group to associate with all instances of the DB cluster. | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | A DB subnet group to associate with this DB instance. | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If the DB instance should have deletion protection enabled. | `bool` | `false` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. | `list(string)` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | The engine to use. | `string` | `"aurora-mysql"` | no |
| <a name="input_engine_mode"></a> [engine\_mode](#input\_engine\_mode) | The database engine mode. | `string` | `"provisioned"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use. | `string` | n/a | yes |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. | `string` | `"final-snapshot"` | no |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled. | `bool` | `false` | no |
| <a name="input_iam_roles"></a> [iam\_roles](#input\_iam\_roles) | A List of ARNs for the IAM roles to associate to the RDS Cluster. | `list(string)` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of Provisioned IOPS to be initially allocated for each DB instance in the Multi-AZ DB cluster. | `number` | `null` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. | `number` | `6033` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. | `string` | `"00:00-02:30"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The weekly time range during which system maintenance can occur, in (UTC). | `string` | `"Mon:03:00-Mon:04:30"` | no |
| <a name="input_replication_source_identifier"></a> [replication\_source\_identifier](#input\_replication\_source\_identifier) | ARN of the source DB cluster or DB instance if this DB cluster is created as a Read Replica. | `string` | `null` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. | `bool` | `false` | no |
| <a name="input_source_region"></a> [source\_region](#input\_source\_region) | The source region for an encrypted replica DB cluster. | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS Cluster. | `map(any)` | `{}` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate with the Cluster | `list(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the cluster |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The cluster endpoint |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cluster |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.40 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.4 |

## Resources

- resource.aws_rds_cluster.main (modules/rds_cluster/main.tf#5)
- resource.random_password.master_password (modules/rds_cluster/main.tf#112)
- resource.random_string.master_username (modules/rds_cluster/main.tf#106)
- data source.aws_availability_zones.available (modules/rds_cluster/main.tf#1)
<!-- END_TF_DOCS -->
