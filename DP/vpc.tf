variable "region" {
    default = "us-east-1"
}
#data "aws_availability_zones" "available" {}

module vpc {
    source = "terraform-aws-modules/vpc/aws"
    version = "4.0.1"
    name = "l124-DP-VPC"
    cidr = "10.0.0.0/16"
    azs = data.aws_availability_zones.available.names
    #private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    #public_subnets =  ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets =  ["10.0.4.0/24", "10.0.5.0/24"]
    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
    tags = {
    "Name" = "l124-DP-VPC"
}
public_subnet_tags = {
    "Name" = "l124-DP-Public-Subnet"
}
private_subnet_tags = {
    "Name" = "l124-DP-Private-Subnet"
}
}

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