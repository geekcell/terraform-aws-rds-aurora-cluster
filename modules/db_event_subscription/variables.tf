# Context
variable "tags" {
  default     = {}
  description = "Tags to add to the AWS RDS Proxy."
  type        = map(any)
}

# AWS RDS DB Event Subscription
variable "name" {
  description = "The name of the DB event subscription."
  type        = string
}

variable "event_categories" {
  default = [
    "configuration change",
    "creation",
    "deletion",
    "failover",
    "failure",
    "global-failover",
    "maintenance",
    "migration",
    "notification",
    "serverless"
  ]
  description = "A list of event categories for a SourceType that you want to subscribe to."
  type        = list(string)
}

variable "recipients" {
  description = "A list of email addresses to receive events."
  type        = list(string)
}

variable "source_ids" {
  description = "A list of identifiers of the event sources for which events will be returned."
  type        = list(string)
}

variable "source_type" {
  default     = null
  description = "The type of source that will be generating the events."
  type        = string
}
