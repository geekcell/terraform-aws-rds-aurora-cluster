resource "aws_db_event_subscription" "main" {
  name      = var.name
  sns_topic = module.notification.arn

  # Source
  source_type = var.source_type
  source_ids  = var.source_ids

  # Event categories
  event_categories = var.event_categories

  tags = var.tags
}

module "notification" {
  source          = "github.com/geekcell/terraform-aws-sns-email-notification?ref=v1.0"
  name            = var.name
  email_addresses = var.recipients
}
