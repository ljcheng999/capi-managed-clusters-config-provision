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

}

