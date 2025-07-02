


addition_tags = {}

region = "us-east-1"
vpc_id = "vpc-00a828fc2b002c772"

# assume_role_str = ""

aws_account_id_allow_assume_self        = "022985595394"                     # itself
aws_account_id_upstream                 = "022985595394"                     # upstream_aws_account

capi_shared_sg_name = "capi-shared-private-sg"


aws_downstream_eks_config = [
  {
    upstream_cluster_name = "capi-cm-poc",
    upstream_cluster_capa_sa = "capa-eks-sa"
    upstream_cluster_capa_sa_namespace = "capa-eks-init"
  }
]