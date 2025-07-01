


addition_tags = {}

region = "us-east-1"
vpc_id = "vpc-00a828fc2b002c772"

# assume_role_str = ""

aws_account_id_allow_assume_self        = "022985595394"                     # itself
aws_account_id_upstream                 = "022985595394"                     # upstream_aws_account
aws_account_id_upstream_cluster_oidc_ids = [ # Required
  {
    name = "JcLocalTest",
    aws_account_id_upstream_cluster_oidc_id = "22F52EF1E314E466BB938EE338151D05"
  }
]

capi_shared_sg_name = "capi-shared-private-sg"


