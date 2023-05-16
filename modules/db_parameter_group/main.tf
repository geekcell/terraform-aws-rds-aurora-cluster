resource "aws_db_parameter_group" "main" {
  count = var.type == "instance" ? 1 : 0

  name   = var.name
  family = var.family

  dynamic "parameter" {
    for_each = var.parameters

    content {
      apply_method = parameter.value.apply_method
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = var.tags
}

resource "aws_rds_cluster_parameter_group" "main" {
  count = var.type == "cluster" ? 1 : 0

  name   = var.name
  family = var.family

  dynamic "parameter" {
    for_each = var.parameters

    content {
      apply_method = parameter.value.apply_method
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }

  tags = var.tags
}
