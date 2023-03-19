provider "aws"{
    region = "us-east-1"
}

# resource "random_string"  "random"{
#   length = 16
#   special = true
#   min_special = 5
#   override_special = "/@&%^[]{};<>"        
# }


# resource "aws_ssm_parameter" "db_master_password" {
#   name = var.pass_db
#   description  = "Password for Db"
#   type  = "SecureString"
#   value = random_string.random.result
# }

# data "aws_ssm_parameter" "db_master_password" {
#   name  = var.pass_db
# }


resource "aws_db_instance" "l124_postgres" {

 publicly_accessible  = var.db_publicly_accessible
 allocated_storage    = var.db_storage_allocated
 storage_type         = var.db_storage_type
 engine               = var.db_engine
 engine_version       = var.db_engine_version
 instance_class       = var.db_instance
 identifier           = var.db_identivier
 db_name              = var.db_enviroment
 username             = var.user_db
 password = data.aws_ssm_parameter.db_master_password.value

}