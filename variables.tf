# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS Cluster Instance."
  type        = map(any)
}

# AWS RDS Cluster
variable "additional_reader_capacity" {
  default     = 0
  description = "The minimum of additional reader capacity in an AWS RDS Cluster."
  type        = number
}

variable "auto_minor_version_upgrade" {
  default     = false
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type        = bool
}

variable "allow_major_version_upgrade" {
  default     = false
  description = "Indicates that major version upgrades are allowed."
  type        = bool
}

variable "apply_immediately" {
  default     = true
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window. "
  type        = bool
}

variable "backup_retention_period" {
  default     = 35
  description = "The days to retain backups for. Must be between 0 and 35."
  type        = number
}

variable "cluster_identifier" {
  description = "The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  type        = string
}

variable "database_event_recipients" {
  default     = []
  description = "Recipients of the database events."
  type        = list(string)
}

variable "database_name" {
  default     = null
  description = "Name for an automatically created database on cluster creation."
  type        = string
}

variable "database_subnet_group_name" {
  description = "Name of DB subnet group."
  type        = string
}

variable "db_proxy_users" {
  default = [
    "application_dml",
    "application_ddl",
  ]
  description = "List of DB Proxy users."
  type        = list(string)
}

variable "deletion_protection" {
  default     = true
  description = "If the DB instance should have deletion protection enabled."
  type        = bool
}

variable "enable_db_proxy" {
  default     = true
  description = "Enable DB Proxy."
  type        = bool
}

variable "enabled_cloudwatch_logs_exports" {
  default = [
    "audit",
    "error",
    "general",
    "slowquery"
  ]
  description = "Set of log types to enable for exporting to CloudWatch logs."
  type        = list(string)
}

variable "engine" {
  default     = "aurora-mysql"
  description = "The engine to use."
  type        = string
}

variable "engine_version" {
  default     = null
  description = "The engine version to use."
  type        = string
}

variable "engine_mode" {
  default     = "provisioned"
  description = "The engine mode to use."
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
}

variable "db_instance_family" {
  default     = "aurora-mysql8.0"
  description = "The family of the DB parameter group."
  type        = string
}

variable "db_instance_parameter_group_name" {
  description = "The name of the DB parameter group."
  default     = null
  type        = string
}

variable "db_instance_parameters" {
  default     = []
  description = "The name and values of the DB parameters."
  type = list(object({
    apply_method = optional(string)
    name         = string
    value        = string
  }))
}

variable "db_cluster_family" {
  default     = "aurora-mysql8.0"
  description = "The family of the DB cluster group."
  type        = string
}

variable "db_cluster_parameter_group_name" {
  description = "The name of the DB cluster parameter group."
  default     = null
  type        = string
}

variable "db_cluster_parameters" {
  default     = []
  description = "The name and values of the DB parameters."
  type = list(object({
    apply_method = optional(string)
    name         = string
    value        = string
  }))
}

variable "monitoring_interval" {
  default     = 60
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance."
  type        = number
}

variable "performance_insights_enabled" {
  default     = true
  description = "Specifies whether Performance Insights is enabled or not."
  type        = bool
}

variable "performance_insights_retention_period" {
  default     = 7
  description = "Amount of time in days to retain Performance Insights data."
  type        = number
}

variable "preferred_backup_window" {
  default     = "00:00-02:30"
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  type        = string
}

variable "preferred_maintenance_window" {
  default     = "Mon:03:00-Mon:04:30"
  description = "The weekly time range during which system maintenance can occur, in (UTC)."
  type        = string
}

variable "port" {
  default     = 3306
  description = "The port on which the DB accepts connections."
  type        = number
}

variable "vpc_security_group_ids_rds_cluster" {
  default     = null
  description = "List of VPC security groups to associate with the RDS Proxy."
  type        = list(string)
}

variable "vpc_security_group_ids_rds_proxy" {
  default     = null
  description = "List of VPC security groups to associate with the RDS Proxy."
  type        = list(string)
}

variable "vpc_subnet_ids" {
  description = "List of VPC subnet IDs."
  type        = list(string)
}
