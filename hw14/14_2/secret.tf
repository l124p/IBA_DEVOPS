resource "random_string"  "random"{
  length = 16
  special = true
  min_special = 5
  override_special = "/@&%^[]{};<>"        
}

resource "aws_ssm_parameter" "db_master_password" {
  name = var.pass_db
  description  = "Password for Db"
  type  = "SecureString"
  value = random_string.random.result
}

data "aws_ssm_parameter" "db_master_password" {
  name  = var.pass_db
}
