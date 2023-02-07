/**
 * # Terraform AWS RDS Aurora
 *
 * Terraform module which creates an AWS RDS Cluster with Aurora Setup.
 * The focus on this module lies within it's simplicity by providing default values
 * that should make sense for most use cases.
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

  source = "github.com/geekcell/terraform-aws-backup?ref=main"

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
