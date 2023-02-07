# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS Proxy."
  type        = map(any)
}

# AWS RDS Cluster
variable "rds_cluster_identifier" {
  description = "RDS cluster identifier."
  type        = string
}

variable "rds_cluster_endpoint" {
  description = "The DNS address of the RDS cluster."
  type        = string
}

# AWS RDS Proxy
variable "auth_scheme" {
  default     = "SECRETS"
  description = "he type of authentication that the proxy uses for connections from the proxy to the underlying database."
  type        = string
}

variable "description" {
  default     = "Authentication using Username and Password"
  description = "A user-specified description about the authentication used by a proxy to log in as a specific database user."
  type        = string
}

variable "iam_auth" {
  default     = "DISABLED"
  description = "Whether to require or disallow AWS Identity and Access Management (IAM) authentication for connections to the proxy."
  type        = string
}

variable "name" {
  description = "The identifier for the proxy."
  type        = string
}

variable "debug_logging" {
  default     = false
  description = "Whether the proxy includes detailed information about SQL statements in its logs."
  type        = bool
}
variable "engine_family" {
  default     = "MYSQL"
  description = "The kinds of databases that the proxy can connect to. "
  type        = string

  validation {
    condition     = contains(["MYSQL", "POSTGRESQL"], var.engine_family)
    error_message = "The engine family must be either MYSQL or POSTGRESQL."
  }
}

variable "idle_client_timeout" {
  default     = 1800
  description = "The number of seconds that a connection to the proxy can be inactive before the proxy disconnects it."
  type        = number
}

variable "require_tls" {
  default     = true
  description = "A Boolean parameter that specifies whether Transport Layer Security (TLS) encryption is required for connections to the proxy."
  type        = bool
}

variable "users" {
  default     = []
  description = "A list of maps containing the username for the database user."
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the proxy."
  type        = list(string)
}

variable "vpc_subnet_ids" {
  description = "One or more VPC subnet IDs to associate with the new proxy."
  type        = list(string)
}
