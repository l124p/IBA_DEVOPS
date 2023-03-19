
#  locals {
#   # Common tags to be assigned to all resources
#         #my_tags = "${var.enviroment}-${var.country}"
#         #enviroment = "${var.enviroment}-${var.country} - PROD - ${var.region}"
#         instance_name = "${terraform.workspace}-ec2-l124"
#     }

# resource "aws_instance" "l124" {
#     ami = var.ami
#     instance_type = var.instance_type
    
#     tags = {
#       Name = local.instance_name
#       #Env = local.enviroment
#       #Application = local.my_tags
#     }

 
#  }   


# resource "aws_security_group" "l124_sg" {
#    name = var.name_security_group
#    description = var.description_sg
#    tags = {
#      Name = var.name_security_group
#      Env = var.description_sg

#    }
#     ingress {
#      from_port   = 22
#      to_port     = 22
#      protocol    = "tcp"
#      cidr_blocks = ["0.0.0.0/0"]
#    }

#    egress {
#      from_port   = 0
#      to_port     = 0
#      protocol    = "-1"
#      cidr_blocks = ["0.0.0.0/0"]
#    }

#  }



# locals {

#         name = "l124_sec_group" 
#         tag_name = "l124_sg" 
#         description = "Allow SSH traffic"
#         enviroment = "DEV SG"
#        }


#resource "aws_security_group" "l124_security" {
#   name = local.name
#   description = local.description
#   tags = {
#     Name = local.tag_name
#     Env = local.enviroment

#   }
#    ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }



resource "random_string"  "random"{
        length = 14
        special = true
        min_special = 5
        override_special = "/@&%^[]{};<>"        
}


resource "aws_ssm_parameter" "db_master_password" {
  #name  = "${var.environment}/database/password/master"
  name = var.pass_db
  description  = "Password for Db"
  type  = "SecureString"
  value = random_string.random.result
  # tags {
  # #   environment = "${var.environment}"
  # DB = "DEV"
  # }
}

data "aws_ssm_parameter" "db_master_password" {
  name  = var.pass_db
}

resource "aws_db_instance" "l124_postgres" {
 allocated_storage    = 10
 storage_type         = "gp2"
 engine               = "postgres"
 engine_version       = "14.7"
 instance_class       = "db.t3.micro"
 #name                 = "${var.db_enviroment}"
 identifier           = "l124-db-dev"
 db_name              = var.db_enviroment
 username             = "l124"
 #password             = "${var.database_master_password}"
 #password             = database_master_password.parameter.value
 password = data.aws_ssm_parameter.db_master_password.value
  # db_subnet_group_name = "my_database_subnet_group"
 # parameter_group_name = "default.mysql5.7"
# tags {
#   # #   environment = "${var.environment}"
#   Name = "DB"
#   Environment = var.enviroment
#   }
}

