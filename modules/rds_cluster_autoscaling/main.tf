resource "aws_appautoscaling_target" "replica" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${var.cluster_identifier}"
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
}

resource "aws_appautoscaling_policy" "replica" {
  name               = "CPU-Autoscaling-Policy"
  service_namespace  = aws_appautoscaling_target.replica.service_namespace
  scalable_dimension = aws_appautoscaling_target.replica.scalable_dimension
  resource_id        = aws_appautoscaling_target.replica.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = 70
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
