output "arn" {
  value = aws_secretsmanager_secret_version.main.arn
}

output "kms_arn" {
  value = module.kms.alias_arn
}
