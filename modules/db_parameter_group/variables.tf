# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS DB Parameter Group."
  type        = map(any)
}

# AWS RDS DB Parameter group
variable "family" {
  default     = "aurora8.0"
  description = "The family of the DB parameter group."
  type        = string
}

variable "name" {
  description = "The name of the DB parameter group."
  type        = string
}

variable "parameters" {
  default     = []
  description = "The name and Values of the DB parameters."
  type        = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
}
