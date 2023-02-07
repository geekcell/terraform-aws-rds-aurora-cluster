module "basic-example" {
  source = "../../"

  cluster_identifier                 = "my-db"
  database_subnet_group_name         = "db-subnet-group"
  instance_class                     = "db.t3.medium"
  vpc_security_group_ids_rds_cluster = ["sg-1234567890"]
  vpc_subnet_ids                     = ["subnet-12345678", "subnet-87654321"]
}
