variable "default_aws_region" {
  type    = string
  default = "us-east-1"
}
variable "region" {
  type    = string
  default = ""
}

variable "assume_role_str" {
  type    = string
  default = ""
}

variable "addition_tags" {
  type    = map(any)
  default = {}
}

variable "vpc_id" {
  type    = string
  default = ""
}
variable "capi_shared_sg_name" {
  type    = string
  default = ""
}

variable "aws_account_id_allow_assume_self" {
  type    = string
  default = ""
}

variable "aws_account_id_upstream" {
  type    = string
  default = ""
}

variable "default_capa_service_account_name" {
  type    = string
  default = "capa-cluster-irsa-init"
}

variable "aws_downstream_eks_config" {
  default = []
}
