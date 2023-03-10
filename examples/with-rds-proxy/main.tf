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
