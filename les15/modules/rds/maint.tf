resource "aws_db_instance" "l124_postgres" {

 #publicly_accessible  = var.db_publicly_accessible
 allocated_storage    = "10"
 storage_type         = "gp2"
 engine               = "postgres"
 engine_version       = "14.7"
 instance_class       = "db.t3.micro"
 identifier           = "l124-db"
 db_name              = "prod"
 username             = "l124"
 password = "dev_pass_postgress"

     tags = {
       Name = "l124"
     }
}