output "cluster_endpoint" {
  description = "The cluster endpoint"
  value       = module.rds_cluster.endpoint
}

output "instance_endpoint" {
  description = "The instance endpoint"
  value       = module.rds_cluster_instance.endpoint
}
