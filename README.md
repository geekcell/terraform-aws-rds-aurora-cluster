<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-aurora-cluster)](https://github.com/geekcell/terraform-aws-aurora-cluster/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-aurora-cluster?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-aurora-cluster/releases)
[![Release](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-aurora-cluster/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-aurora-cluster/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-aurora-cluster&benchmark=FEDRAMP+%28MODERATE%29)

# Terraform AWS RDS Aurora

This Terraform module provides a preconfigured solution for setting up AWS
RDS Aurora clusters in your AWS account. With this module, you can easily
and efficiently create and manage RDS Aurora clusters with advanced features
such as extended backups for daily, weekly, monthly, quarterly, and yearly
intervals. Our team has extensive experience working with AWS RDS Aurora
and has optimized this module to provide the best possible experience for
users.

By using this Terraform module, you can save time and effort in setting
up and managing your RDS Aurora clusters, as well as ensure that your data
is secure and protected. The module creates two users on the RDS Proxy,
one with DML rights and one with DDL rights, to provide an additional
layer of security and management. The autoscaling feature is also
preconfigured, allowing for efficient and automatic management of
resources based on your workload. The module encapsulates all necessary
configurations, making it easy to use and integrate into your existing
AWS environment. Whether you are just getting started with AWS RDS Aurora
or looking for a more efficient way to manage your clusters, this
Terraform module provides a preconfigured solution with advanced features
such as extended backups, user management, and autoscaling.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_reader_capacity"></a> [additional\_reader\_capacity](#input\_additional\_reader\_capacity) | The minimum of additional reader capacity in an AWS RDS Cluster. | `number` | `0` | no |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35. | `number` | `35` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The cluster identifier. If omitted, Terraform will assign a random, unique identifier. | `string` | n/a | yes |
| <a name="input_database_event_recipients"></a> [database\_event\_recipients](#input\_database\_event\_recipients) | Recipients of the database events. | `list(string)` | `[]` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | Name for an automatically created database on cluster creation. | `string` | `null` | no |
| <a name="input_database_subnet_group_name"></a> [database\_subnet\_group\_name](#input\_database\_subnet\_group\_name) | Name of DB subnet group. | `string` | n/a | yes |
| <a name="input_db_parameters"></a> [db\_parameters](#input\_db\_parameters) | The name and Values of the DB parameters. | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "autocommit",<br>    "value": "1"<br>  }<br>]</pre> | no |
| <a name="input_db_proxy_users"></a> [db\_proxy\_users](#input\_db\_proxy\_users) | List of DB Proxy users. | `list(string)` | <pre>[<br>  "application_dml",<br>  "application_ddl"<br>]</pre> | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If the DB instance should have deletion protection enabled. | `bool` | `false` | no |
| <a name="input_enable_db_proxy"></a> [enable\_db\_proxy](#input\_enable\_db\_proxy) | Enable DB Proxy. | `bool` | `true` | no |
| <a name="input_enable_enhanced_backups"></a> [enable\_enhanced\_backups](#input\_enable\_enhanced\_backups) | Enable enhanced backups. | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs. | `list(string)` | <pre>[<br>  "audit",<br>  "error",<br>  "general",<br>  "slowquery"<br>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The engine to use. | `string` | `"aurora-mysql"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use. | `string` | `null` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance. | `string` | n/a | yes |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. | `number` | `60` | no |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights is enabled or not. | `bool` | `true` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | Amount of time in days to retain Performance Insights data. | `number` | `7` | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections. | `number` | `3306` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. | `string` | `"03:00-06:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The window to perform maintenance in. | `string` | `"Mon:00:00-Mon:03:00"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type. | `string` | `"aurora"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS RDS Cluster Instance. | `map(any)` | `{}` | no |
| <a name="input_vpc_security_group_ids_rds_cluster"></a> [vpc\_security\_group\_ids\_rds\_cluster](#input\_vpc\_security\_group\_ids\_rds\_cluster) | List of VPC security groups to associate with the RDS Proxy. | `list(string)` | `null` | no |
| <a name="input_vpc_security_group_ids_rds_proxy"></a> [vpc\_security\_group\_ids\_rds\_proxy](#input\_vpc\_security\_group\_ids\_rds\_proxy) | List of VPC security groups to associate with the RDS Proxy. | `list(string)` | `null` | no |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | List of VPC subnet IDs. | `list(string)` | n/a | yes |

## Outputs

No outputs.

## Providers

No providers.

## Resources


# Examples
### Basic Example
```hcl
module "basic-example" {
  source = "../../"

  cluster_identifier                 = "my-db"
  database_subnet_group_name         = "db-subnet-group"
  instance_class                     = "db.t3.medium"
  vpc_security_group_ids_rds_cluster = ["sg-1234567890"]
  vpc_subnet_ids                     = ["subnet-12345678", "subnet-87654321"]
}
```
### with RDS Proxy
```hcl
module "with-rds-proxy" {
  source = "../../"

  cluster_identifier                 = "my-cluster"
  database_subnet_group_name         = "db-subnet-group-name"
  instance_class                     = "db.t4g.medium"
  vpc_security_group_ids_rds_cluster = ["sg-1234567890"]
  vpc_subnet_ids = [
    "subnet-123", "subnet-456", "subnet-789"
  ]

  enable_db_proxy = true
}
```
### with enhanced Backups
```hcl
module "with-enhanced-backups" {
  source = "../../"

  cluster_identifier                 = "my-cluster"
  database_subnet_group_name         = "db-subnet-group-name"
  instance_class                     = "db.t4g.medium"
  vpc_security_group_ids_rds_cluster = ["sg-1234567890"]
  vpc_subnet_ids                     = ["subnet-12345678", "subnet-87654321"]

  enable_enhanced_backups = true
}
```
<!-- END_TF_DOCS -->
