output "cluster_endpoint" {
  value = module.rds_cluster.endpoint
}

output "instance_endpoint" {
  value = module.rds_cluster_instance.endpoint
}
