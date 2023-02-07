/**
 * # Terraform AWS RDS Aurora
 *
 * This Terraform module provides a preconfigured solution for setting up AWS
 * RDS Aurora clusters in your AWS account. With this module, you can easily
 * and efficiently create and manage RDS Aurora clusters with advanced features
 * such as extended backups for daily, weekly, monthly, quarterly, and yearly
 * intervals. Our team has extensive experience working with AWS RDS Aurora
 * and has optimized this module to provide the best possible experience for
 * users.
 *
 * By using this Terraform module, you can save time and effort in setting
 * up and managing your RDS Aurora clusters, as well as ensure that your data
 * is secure and protected. The module creates two users on the RDS Proxy,
 * one with DML rights and one with DDL rights, to provide an additional
 * layer of security and management. The autoscaling feature is also
 * preconfigured, allowing for efficient and automatic management of
 * resources based on your workload. The module encapsulates all necessary
 * configurations, making it easy to use and integrate into your existing
 * AWS environment. Whether you are just getting started with AWS RDS Aurora
 * or looking for a more efficient way to manage your clusters, this
 * Terraform module provides a preconfigured solution with advanced features
 * such as extended backups, user management, and autoscaling.
 */
module "rds_cluster" {
  source = "./modules/rds_cluster"

  # The name of the cluster
  cluster_identifier = var.cluster_identifier

  # How many read replicas to create
  additional_reader_capacity = var.additional_reader_capacity

  # The engine version to use
  engine         = var.engine
  engine_version = var.engine_version

  # Network
  db_subnet_group_name   = var.database_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids_rds_cluster

  # Security
  deletion_protection = var.deletion_protection

  tags = var.tags
}

module "rds_cluster_instance" {
  source = "./modules/rds_cluster_instance/"

  # Assign to which cluster
  cluster_identifier = module.rds_cluster.id

  # The engine version to use
  engine         = var.engine
  engine_version = var.engine_version

  # Instance identifier
  identifier = var.cluster_identifier

  # Instance class
  instance_class = var.instance_class

  # Network
  db_subnet_group_name = var.database_subnet_group_name

  # Parameter group
  db_parameters = var.db_parameters

  tags = var.tags
}

module "db_proxy" {
  count = var.enable_db_proxy ? 1 : 0

  source = "./modules/db_proxy/"

  # Proxy name
  name = var.cluster_identifier

  # Users
  users = var.db_proxy_users

  # Cluster settings
  rds_cluster_endpoint   = module.rds_cluster.endpoint
  rds_cluster_identifier = module.rds_cluster.id
  vpc_subnet_ids         = var.vpc_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids_rds_proxy

  tags = var.tags
}

module "db_event_subscription" {
  source = "./modules/db_event_subscription/"

  # Event subscription name
  name = var.cluster_identifier

  # Source(s)
  source_type = "db-cluster"
  source_ids = [
    module.rds_cluster.id
  ]

  recipients = var.database_event_recipients
}

module "backup" {
  count = var.enable_enhanced_backups ? 1 : 0

  source = "github.com/geekcell/terraform-aws-backup?ref=v1.0"

  # Vault name for this backup
  vault_name = "${var.cluster_identifier}-rds"

  # Backup plan name, most of the time the identifier of the cluster is fine
  backup_name = "${var.cluster_identifier}-rds"

  # Resources to backup
  resources = [
    module.rds_cluster.arn
  ]

  # AWS needs to know what kind of services we want to backup
  service = "rds"

  tags = var.tags
}
