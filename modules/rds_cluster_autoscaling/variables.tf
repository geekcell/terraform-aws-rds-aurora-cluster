# AWS RDS Cluster Autoscaling
variable "cluster_identifier" {
  description = "The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  type        = string
}

variable "min_capacity" {
  default     = 1
  description = "The minimum capacity of the cluster. Defaults to 1."
  type        = number
}

variable "max_capacity" {
  default     = 15
  description = "The maximum capacity of the cluster. Defaults to 15."
  type        = number
}
