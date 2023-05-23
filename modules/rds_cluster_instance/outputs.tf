output "endpoint" {
  description = "The address of the RDS instance."
  value       = aws_rds_cluster_instance.main.endpoint
}
