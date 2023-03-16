provider "aws"{
    region = "us-east-1"
}

resource "aws_vpc" "l124_custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "l124 Custom VPC"
  }
}

resource "aws_subnet" "l124_public_subnet" {
  vpc_id            = aws_vpc.l124_custom_vpc.id
  cidr_block        = "10.0.1.0/24"

  tags = {
    Name = "l124 Public Subnet"
  }
}

resource "aws_security_group" "l124_security" {
  name   = "l124_sec_group"
  description = "Allow SSH traffic"
  vpc_id = aws_vpc.l124_custom_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "l124" {
    ami = var.aws_instance
    instance_type = "t2.micro"
    subnet_id = aws_subnet.l124_public_subnet.id
    vpc_security_group_ids = [aws_security_group.l124_security.id]
    
    tags = {
      Name = "l124"
    }
  
}   

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.l124.id
}
