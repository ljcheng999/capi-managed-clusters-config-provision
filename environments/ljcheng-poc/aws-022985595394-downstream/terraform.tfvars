


addition_tags = {}

region = "us-east-1"
vpc_id = "vpc-0e31c7923c4fda729"

# assume_role_str = ""

aws_account_id_allow_assume_self = "022985595394" # itself
aws_account_id_upstream          = "022985595394" # upstream_aws_account

capi_shared_sg_name = "capi-shared-private-sg"


aws_downstream_eks_config = [ # Required
  {
    upstream_eks_name              = ""
    upstream_eks_name_sa           = ""
    upstream_eks_name_sa_namespace = ""
  }
]
