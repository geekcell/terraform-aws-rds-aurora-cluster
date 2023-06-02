output "arn" {
  description = "The ARN of the cluster"
  value       = aws_rds_cluster.main.arn
}

output "id" {
  description = "The ID of the cluster"
  value       = aws_rds_cluster.main.id
}

output "endpoint" {
  description = "The cluster endpoint"
  value       = aws_rds_cluster.main.endpoint
}
