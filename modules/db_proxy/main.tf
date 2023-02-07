resource "aws_db_proxy" "main" {
  name                   = var.name
  debug_logging          = var.debug_logging
  engine_family          = var.engine_family
  idle_client_timeout    = var.idle_client_timeout
  require_tls            = var.require_tls
  role_arn               = aws_iam_role.main.arn
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.vpc_subnet_ids

  dynamic "auth" {
    for_each = module.db_proxy_secret
    content {
      auth_scheme = var.auth_scheme
      description = var.description
      iam_auth    = var.iam_auth
      secret_arn  = auth.value.arn
    }
  }

  tags = merge(
    var.tags,
    {
      "ServiceType" = "db-proxy"
    },
  )
}

resource "aws_db_proxy_default_target_group" "main" {
  db_proxy_name = aws_db_proxy.main.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    init_query                   = ""
    max_connections_percent      = 100
    max_idle_connections_percent = 50
    session_pinning_filters      = []
  }
}

resource "aws_db_proxy_target" "main" {
  db_cluster_identifier = var.rds_cluster_identifier
  db_proxy_name         = aws_db_proxy.main.name
  target_group_name     = aws_db_proxy_default_target_group.main.name
}

resource "aws_db_proxy_endpoint" "read_only" {
  db_proxy_name          = aws_db_proxy.main.name
  db_proxy_endpoint_name = "${var.name}-read-only"
  vpc_subnet_ids         = var.vpc_subnet_ids
  target_role            = "READ_ONLY"
}

resource "aws_iam_role" "main" {
  name               = "${var.name}-proxy"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "main" {
  name   = "${var.name}-proxy"
  policy = data.aws_iam_policy_document.proxy.json
}

resource "aws_iam_role_policy_attachment" "main" {
  policy_arn = aws_iam_policy.main.arn
  role       = aws_iam_role.main.name
}

module "db_proxy_secret" {
  for_each = toset(var.users)
  source   = "../db_proxy_secret"

  # Name
  name = format(
    "rds/proxy/%s/cluster/%s/user/%s/credentials",
    var.name,
    var.rds_cluster_identifier,
    each.key
  )
  description = "AWS RDS Proxy User Credentials."
  username    = each.key

  tags = var.tags
}
