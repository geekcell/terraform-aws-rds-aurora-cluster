resource "aws_iam_role" "main" {
  name        = "${var.name}-enhanced-monitoring-role"
  description = "Role used by Cloudwatch to monitor the database."

  assume_role_policy = data.aws_iam_policy_document.main.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}
