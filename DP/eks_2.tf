

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "3.19.0"

#   name = var.VPC_name

#   cidr = "10.0.0.0/16"
#   azs  = slice(data.aws_availability_zones.available.names, 0, 3)

#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

#   enable_nat_gateway   = true
#   single_nat_gateway   = true
#   enable_dns_hostnames = true

#   public_subnet_tags = {
#     "kubernetes.io/cluster/${var.Cluster_name}" = "shared"
#     "kubernetes.io/role/elb"                      = 1
#   }

#   private_subnet_tags = {
#     "kubernetes.io/cluster/${var.Cluster_name}" = "shared"
#     "kubernetes.io/role/internal-elb"             = 1
#   }
# }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.12"
  #version = "18.30.0"

  cluster_name    = "l124-DP-Cluster"
  cluster_version = "1.25"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

    # Encryption key
#   create_kms_key = false
#   cluster_encryption_config = {
#      resources = null
#    }
  create_kms_key            = false
  cluster_encryption_config = {}

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"

  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t2.micro"]

      min_size     = 2
      max_size     = 4
      desired_size = 2
    }

    two = {
      name = "node-group-2"

      instance_types = ["t2.micro"]

      min_size     = 2
      max_size     = 4
      desired_size = 2
    }
  }

}

# resource "aws_kms_key" "secrets" {
#     description         = "My KMS Keys for Data Encryption"
#     customer_master_key_spec = "SYMMETRIC_DEFAULT"
#     is_enabled               = false
#      #enable_key_rotation      = var.rotation_enabled  

#     tags = {
#         Name = "my_kms_key"
#       }
#   }

# resource "aws_kms_alias" "secrets" {
#   name          = "alias/secrets"
#   target_key_id = "${aws_kms_key.secrets.key_id}"
# }