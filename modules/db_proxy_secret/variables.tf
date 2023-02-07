# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS Customer Managed Key."
  type        = map(any)
}

# Secrets Manager
variable "name" {
  description = "Friendly name of the new secret."
  type        = string
}

variable "description" {
  description = "Description of the secret."
  type        = string
}

variable "username" {
  description = "Username for the secret."
  type        = string
}
