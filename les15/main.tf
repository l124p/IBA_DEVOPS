terraform {
backend "s3" {
  bucket = "l124-les15"
  key = "prod.tfstate"
  region = "us-east-1"
  dynamodb_table = "l124-run-locks"
}

}



# resource "aws_instance" "l124" {
#     ami = "ami-09cd747c78a9add63"
#     instance_type = "t2.micro"
#     #subnet_id = aws_subnet.l124_public_subnet.id
#     #vpc_security_group_ids = [aws_security_group.l124_security.id]
    
#     tags = {
#       Name = "l124"
#     }
  
# }   

# resource "aws_db_instance" "l124_postgres" {

#  #publicly_accessible  = var.db_publicly_accessible
#  allocated_storage    = "10"
#  storage_type         = "gp2"
#  engine               = "postgres"
#  engine_version       = "14.7"
#  instance_class       = "db.t3.micro"
#  identifier           = "l124-db"
#  db_name              = "prod"
#  username             = "l124"
#  password = "dev_pass_postgress"

#      tags = {
#        Name = "l124"
#      }
# }

module "ec2"{

  source = "./modules/ec2"
}

# module "dynamo"{

#   source = "./modules/dynamo"
# }


# module "rds"{

#   source = "./modules/rds"
# }

# module "dynamodb_table" {
#   source   = "terraform-aws-modules/dynamodb-table/aws"

#   name     = "l124-run-locks"
#   hash_key = "ID"

#   attributes = [
#     {
#       name = "LockID"
#       type = "S"
#     }
#   ]

#   tags = {
#     Terraform   = "true"
#     Environment = "staging"
#   }
# }