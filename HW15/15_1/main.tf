provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
}

module "ssm_parameter" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/2.0.0"
  name   = "l124_instance_name"
  value  = "ubuntu-instance"

  type            = "String"
  description     = "The name of the EC2 instance"
  key_id          = ""
  overwrite       = true
  allowed_pattern = ""
  enabled         = true


  tags = {
    Environment = "dev"
    Name        = "instance_name"
  }
}