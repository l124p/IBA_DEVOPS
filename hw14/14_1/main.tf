provider "aws"{
    region = var.region
}

locals {
    aws_name = "l124_${terraform.workspace}"
    aws_sg_name = "l124_sg_${terraform.workspace}"
    aws_subnet_name = "l124_subnet_${terraform.workspace}"
         }


resource "aws_vpc"  "l124_vpc"{
  
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = local.aws_name
  }
}

resource "aws_subnet" "l124_public_subnet" {
  vpc_id            = aws_vpc.l124_vpc.id
  cidr_block        = var.sub_cidr_block

  tags = {
     Name = local.aws_subnet_name
    }
  }




