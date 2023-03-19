provider "aws" {
#profile = "default"
region = "us-east-1"
}

 resource "aws_instance" "web" {
   ami = var.inst
   
   instance_type = "t2.micro"
   tags = {
     Name = "Hello"
   }
 }
