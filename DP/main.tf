provider "aws" {
  region = local.region
}

data "aws_availability_zones" "available" {}

#data "aws_availability_zones" "available" {
    #state = "available"
#}


locals {
  name   = "ex-${replace(basename(path.cwd), "_", "-")}"
  #name = ""
  region = "us-east-1"

  #vpc_cidr = "10.0.0.0/16"
  #azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
   # GithubRepo = "terraform-aws-eks"
   # GithubOrg  = "terraform-aws-modules"
  }
}

# data "terraform_remote_state" "eks" {
#   backend = "local"
#   config = {
#     path = "../eks/terraform.tfstate"
#   }
# }