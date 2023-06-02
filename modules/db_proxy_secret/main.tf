locals {
  secret = {
    username = var.username
    password = random_password.password.result
  }
}

resource "random_password" "password" {
  length  = 32
  special = false
}

resource "aws_secretsmanager_secret" "main" {
  name        = var.name
  description = var.description

  kms_key_id = module.kms.alias_arn

  recovery_window_in_days = 30

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "main" {
  secret_id     = aws_secretsmanager_secret.main.id
  secret_string = jsonencode(local.secret)
}

module "kms" {
  source = "github.com/geekcell/terraform-aws-kms?ref=v1"

  alias = var.name

  tags = var.tags
}
