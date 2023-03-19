variable "enviroment"{
 default = "Dev"
 }

 variable "db_enviroment"{
 default = "dev_db_postgress"
 }

variable "user_db"{
 default = "l124"
 }

variable "pass_db"{
 default = "dev_pass_postgress"
 }

variable "db_engine"{
 default = "postgres"
 }

variable "db_engine_version"{
 default = "14.6"
 }

variable "db_storage_type"{
 default = "gp2"
 } 

variable "db_storage_allocated"{
 default = "10"
 }

variable "db_instance"{
 default = "db.t3.micro"
 }

variable "db_identivier"{
 default = "l124-db"
 }
 
variable "db_publicly_accessible"{
 default = true
 }
