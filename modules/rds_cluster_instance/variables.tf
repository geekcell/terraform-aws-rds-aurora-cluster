# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS Customer Managed Key."
  type        = map(any)
}

# AWS RDS Cluster Instance
variable "auto_minor_version_upgrade" {
  default     = false
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
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

variable "ca_cert_identifier" {
  default     = "rds-ca-2019"
  description = "The identifier of the CA certificate for the DB instance."
  type        = string
}

variable "cluster_identifier" {
  description = "The cluster identifier."
  type        = string
}

variable "copy_tags_to_snapshot" {
  default     = true
  description = "Copy all Cluster tags to snapshots."
  type        = bool
}

variable "db_parameters" {
  default = [
    {
      name  = "autocommit"
      value = "1"
    }
  ]
  description = "The name and Values of the DB parameters."
  type = list(object({
    name  = string
    value = string
  }))
}

variable "db_parameter_group_name" {
  default     = null
  description = "A parameter group to associate with the instance."
  type        = string
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
  type        = string
}

variable "engine" {
  default     = null
  description = "The engine to use."
  type        = string
}

variable "engine_version" {
  default     = null
  description = "The engine version to use."
  type        = string
}

variable "identifier" {
  description = "The name of the RDS instance."
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
}

variable "family" {
  default     = "mysql8.0"
  description = "The family of the DB parameter group."
  type        = string
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
  default     = "03:00-06:00"
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled."
  type        = string
}

variable "preferred_maintenance_window" {
  default     = "Mon:00:00-Mon:03:00"
  description = "The window to perform maintenance in."
  type        = string
}

variable "publicly_accessible" {
  default     = false
  description = "Specifies if the RDS instance is publicly accessible."
  type        = bool
}

variable "storage_type" {
  default     = "aurora"
  description = "Storage type."
  type        = string

  validation {
    condition     = contains(["aurora"], var.storage_type)
    error_message = "Value must be `aurora`."
  }
}
