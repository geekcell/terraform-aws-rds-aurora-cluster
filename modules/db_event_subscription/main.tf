resource "aws_db_event_subscription" "main" {
  name      = var.name
  sns_topic = module.sns.arn

  # Source
  source_type = var.source_type
  source_ids  = var.source_ids

  # Event categories
  event_categories = [
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

  tags = var.tags
}

module "sns" {
  source          = "github.com/geekcell/terraform-aws-sns-email-notification?ref=v1"
  name            = var.name
  email_addresses = var.recipients
}
