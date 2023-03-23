provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}


# VPC Module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "l124-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  single_nat_gateway = true

  private_subnet_tags = {
    Name = "l124-private"
  }

  public_subnet_tags = {
    Name = "l124-public"
  }

  tags = {
    Owner       = "l124"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "l124-vpc"
  }
}
