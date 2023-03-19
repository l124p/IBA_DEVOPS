# resource "random_password" "db_master_pass" {
#   length            = 40
#   special           = true
#   min_special       = 5
#   override_special  = "!#$%^&*()-_=+[]{}<>:?"
#   keepers           = {
#     pass_version  = 1
#   }
# }

# resource "aws_db_instance" "mysql_db" {
#   username                            = "mysql_user"
#   #password                            = random_password.db_master_pass.result
#   password                            = aws_secretsmanager_secret_version.db-pass-val.secret_string

# }


