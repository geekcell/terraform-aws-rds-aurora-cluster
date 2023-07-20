# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS Cluster."
  type        = map(any)
}

# AWS RDS Cluster
variable "additional_reader_capacity" {
  default     = 0
  description = "The minimum of additional reader capacity in an AWS RDS Cluster."
  type        = number
}

variable "allocated_storage" {
  default     = null
  description = "The amount of storage in gibibytes (GiB) to allocate to each DB instance in the Multi-AZ DB cluster."
  type        = number
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

variable "backtrack_window" {
  default     = 0
  description = "The target backtrack window, in seconds."
  type        = number
}

variable "backup_retention_period" {
  default     = 35
  description = "The days to retain backups for. Must be between 0 and 35."
  type        = number
}

variable "copy_tags_to_snapshot" {
  default     = true
  description = "Copy all Cluster tags to snapshots."
  type        = bool
}

variable "cluster_identifier" {
  description = "The cluster identifier."
  type        = string
}

variable "database_name" {
  default     = null
  description = "Name for an automatically created database on cluster creation."
  type        = string
}

variable "db_cluster_instance_class" {
  default     = null
  description = "The compute and memory capacity of each DB instance in the Multi-AZ DB cluster."
  type        = string
}

variable "db_cluster_parameter_group_name" {
  default     = null
  description = "A cluster parameter group to associate with the cluster."
  type        = string
}

variable "db_instance_parameter_group_name" {
  default     = null
  description = "Instance parameter group to associate with all instances of the DB cluster."
  type        = string
}

variable "db_subnet_group_name" {
  description = "A DB subnet group to associate with this DB instance."
  type        = string
}

variable "deletion_protection" {
  default     = false
  description = "If the DB instance should have deletion protection enabled."
  type        = bool
}

variable "enabled_cloudwatch_logs_exports" {
  description = "Set of log types to enable for exporting to CloudWatch logs."
  type        = list(string)
}

variable "engine" {
  default     = "aurora-mysql"
  description = "The engine to use."
  type        = string
}

variable "engine_mode" {
  default     = "provisioned"
  description = "The database engine mode."
  type        = string
}

variable "engine_version" {
  description = "The engine version to use."
  type        = string
}

variable "final_snapshot_identifier" {
  default     = "final-snapshot"
  description = "The name of your final DB snapshot when this DB cluster is deleted."
  type        = string
}

variable "iam_database_authentication_enabled" {
  default     = false
  description = "Specifies whether or not mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
}

variable "iam_roles" {
  default     = null
  description = "A List of ARNs for the IAM roles to associate to the RDS Cluster."
  type        = list(string)
}

variable "iops" {
  default     = null
  description = "The amount of Provisioned IOPS to be initially allocated for each DB instance in the Multi-AZ DB cluster."
  type        = number
}

variable "port" {
  default     = 6033
  description = "The port on which the DB accepts connections."
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

variable "replication_source_identifier" {
  default     = null
  description = "ARN of the source DB cluster or DB instance if this DB cluster is created as a Read Replica."
  type        = string
}

variable "source_region" {
  default     = null
  description = "The source region for an encrypted replica DB cluster."
  type        = string
}

variable "skip_final_snapshot" {
  default     = false
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted."
  type        = bool
}

variable "storage_encrypted" {
  default     = true
  description = "Specifies whether the DB cluster is encrypted."
  type        = bool
}

variable "storage_type" {
  default     = null
  description = "Specifies the storage type to be associated with the DB cluster."
  type        = string
}

variable "vpc_security_group_ids" {
  default     = null
  description = "List of VPC security groups to associate with the Cluster"
  type        = list(string)
}
