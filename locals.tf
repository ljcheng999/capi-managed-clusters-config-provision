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
    {
      Sid    = "AllowUpstreamCapiClustersForIRSA",
      Action = "sts:AssumeRoleWithWebIdentity",
      Effect = "Allow",
      Principal = {
        Federated = "arn:aws:iam::${var.aws_account_id_upstream}:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/${var.aws_account_id_upstream_cluster_oidc_id}"
      },
      Condition = {
        "StringLike" : {
          "oidc.eks.us-east-1.amazonaws.com/id/${var.aws_account_id_upstream_cluster_oidc_id}:sub" : "system:serviceaccount:*:${var.default_capa_service_account_name}"
          "oidc.eks.us-east-1.amazonaws.com/id/${var.aws_account_id_upstream_cluster_oidc_id}:aud" : "sts.amazonaws.com"
        }
      }
    },
  ]
}

