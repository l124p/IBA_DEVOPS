provider "aws"{
    region = "us-east-1"
}

data "aws_security_groups" "my_sg" {
    filter {
    name = "tag:Name"
    values = ["l124*"]
  }
}

output "my_security_group" {
  value = data.aws_security_groups.my_sg
}

