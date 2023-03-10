resource "aws_rds_cluster" "main" {

  # Cluster identifier
  cluster_identifier = var.cluster_identifier

  # Engine
  engine                           = var.engine
  engine_version                   = var.engine_version
  allow_major_version_upgrade      = var.allow_major_version_upgrade
  db_instance_parameter_group_name = var.db_instance_parameter_group_name
  engine_mode                      = var.engine_mode
  iam_roles                        = var.iam_roles

  # Storage
  allocated_storage = var.allocated_storage
  iops              = var.iops
  kms_key_id        = module.kms["storage"].key_arn
  storage_encrypted = var.storage_encrypted
  storage_type      = var.storage_type

  # Database name
  database_name = var.database_name

  # Master-Credentials
  master_username = random_string.master_username.result
  master_password = random_password.master_password.result

  # Backups
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window

  # Maintenance
  backtrack_window             = var.backtrack_window
  preferred_maintenance_window = var.preferred_maintenance_window

  # Snapshots
  copy_tags_to_snapshot     = var.copy_tags_to_snapshot
  final_snapshot_identifier = format("%s-%s", var.cluster_identifier, var.final_snapshot_identifier)
  skip_final_snapshot       = var.skip_final_snapshot

  # Network
  vpc_security_group_ids = var.vpc_security_group_ids
  db_subnet_group_name   = var.db_subnet_group_name
  availability_zones     = data.aws_availability_zones.available.names
  port                   = var.port

  # Cluster modifications
  apply_immediately = var.apply_immediately

  # Cluster Instance class
  db_cluster_instance_class = var.db_cluster_instance_class

  # Parameter Group
  db_cluster_parameter_group_name     = var.db_cluster_parameter_group_name
  iam_database_authentication_enabled = var.iam_database_authentication_enabled

  # Cloudwatch
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  # Replication
  source_region                 = var.source_region
  replication_source_identifier = var.replication_source_identifier

  # Security
  deletion_protection = var.deletion_protection

  tags = merge(
    var.tags,
    {
      "Name"        = var.cluster_identifier
      "ServiceType" = "cluster"
    }
  )
}

module "autoscaling" {
  count  = var.additional_reader_capacity >= 1 ? 1 : 0
  source = "../rds_cluster_autoscaling"

  cluster_identifier = aws_rds_cluster.main.id
  min_capacity       = var.additional_reader_capacity
}

module "kms" {
  for_each = toset(["storage"])
  source   = "github.com/geekcell/terraform-aws-kms?ref=v1"
  alias    = format("/rds/cluster/%s/%s", var.cluster_identifier, each.key)
}

resource "random_string" "master_username" {
  length  = 12
  special = false
}

resource "random_password" "master_password" {
  length  = 24
  special = false
}
