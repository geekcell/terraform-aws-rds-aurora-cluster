output "name" {
  value = try(aws_db_parameter_group.main[0].name, aws_rds_cluster_parameter_group.main[0].name)
}
