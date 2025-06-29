
provider "aws" {
  region = var.region

  # assume_role {
  #   role_arn = var.assume_role_str
  # }
}

module "capi_managed_clusters_provision" {
  source                           = "ljcheng999/capi-managed-clusters-provision/aws"
  version                          = "1.0.7"
  aws_account_id_allow_assume_self = var.aws_account_id_allow_assume_self
  aws_account_id_upstream          = var.aws_account_id_upstream

  custom_statement = local.custom_statement

  tags = merge(
    local.tags,
    var.addition_tags
  )
}

module "capi_managed_clusters_security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = var.capi_shared_sg_name
  description = "Security group with all capi downstream clusters per AWS acount"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = 6
      description = "only allow 10.0.0.0/8"
      cidr_blocks = "10.0.0.0/8"
    },
    {
      from_port   = 0
      to_port     = 0
      protocol    = 6
      description = "Service name"
      cidr_blocks = "100.64.0.0/16"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = 6
      description = "Service name"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

  tags = merge(
    local.tags,
    var.addition_tags
  )
}


output "downstream_provision_sg" {
  value = module.capi_managed_clusters_security_group
}

output "capi_managed_clusters_provision" {
  value = module.capi_managed_clusters_provision
}
