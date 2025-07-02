locals {
  tags = {
    organization    = "engineer"
    group           = "engineer"
    team            = "engineer"
    stack           = "capi-managed-clusters-provision"
    email           = "example.com"
    application     = "downstream-provision"
    automation_tool = "terraform"
    automation_path = "services/capi-managed-clusters-provision"
  }

  aws_region = var.region == "" ? var.default_aws_region : var.region

  # This statement is to help the downstream clusters being assumed and update downstream clusters
  custom_statement = [
    for item in var.aws_downstream_eks_config : {
      Sid    = "AllowCapaUpstreamPodIdentityToAssume",
      Effect = "Allow",
      Action = [
        "sts:AssumeRole",
        "sts:TagSession"
      ],
      Principal = {
        AWS = [
          "arn:aws:iam::${var.aws_account_id_upstream}:role/${item.upstream_cluster_name}-pod-identity-auth-mode-role"
        ]
      },
    }
  ]
}

