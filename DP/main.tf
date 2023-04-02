provider "aws" {
  profile = "default"
  region = local.region
}

locals {
  region = "us-east-1"
}

data "aws_availability_zones" "azs" {
    state = "available"
}