resource "aws_rds_cluster_instance" "main" {
  # Cluster Identifier
  cluster_identifier = var.cluster_identifier

  # Identifier
  identifier = var.identifier

  # Hardware
  instance_class = var.instance_class

  # Engine
  engine                     = var.engine
  engine_version             = var.engine_version
  auto_minor_version_upgrade = var.auto_minor_version_upgrade

  # Enhanced Monitoring
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = module.db_enhanced_monitoring.role_arn

  # Performance Insights
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = module.kms["performance_insights"].key_arn
  performance_insights_retention_period = var.performance_insights_retention_period

  # Network
  db_subnet_group_name = var.db_subnet_group_name
  publicly_accessible  = var.publicly_accessible

  # Cluster Instance modifications
  apply_immediately = var.apply_immediately

  # Maintenance
  copy_tags_to_snapshot = var.copy_tags_to_snapshot
  ca_cert_identifier    = var.ca_cert_identifier

  tags = merge(
    var.tags,
    {
      "Name"        = var.identifier
      "ServiceType" = "cluster-instance"
    }
  )
}

module "db_enhanced_monitoring" {
  source = "../db_enhanced_monitoring/"

  name = var.identifier
}

module "kms" {
  for_each = toset(["performance_insights"])

  source = "github.com/geekcell/terraform-aws-kms?ref=v1"
  alias  = format("alias/rds/cluster/%s/instance/%s/%s", var.identifier, var.identifier, each.key)
}

resource "random_string" "master_username" {
  length  = 12
  special = false
}

resource "random_password" "master_password" {
  length  = 24
  special = false
}
