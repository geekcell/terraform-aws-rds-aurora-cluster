data "aws_region" "current" {}

data "aws_iam_policy_document" "proxy" {
  statement {
    sid = "AllowRDSToGetSecretValue"

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      "*"
    ]
  }

  statement {
    sid = "AllowRDSToDecryptKMSKey"

    actions = [
      "kms:Decrypt"
    ]

    resources = [
      "*"
    ]

    condition {
      test     = "StringEquals"
      values   = [format("secretsmanager.%s.amazonaws.com", data.aws_region.current.name)]
      variable = "kms:ViaService"
    }
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}
