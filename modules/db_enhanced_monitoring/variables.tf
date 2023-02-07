# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS Enhanced Monitoring."
  type        = map(any)
}

# AWS RDS DB Enhanced Monitoring
variable "name" {
  description = "The name of the DB Enhanced Monitoring Role."
  type        = string
}
