provider "aws"{
    region = "us-east-1"
}

resource "aws_security_group" "l124_security" {
  Name   = "l124_sec_group"
  description = "Allow SSH traffic"
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
  
  tags = {
      Name = "l124_sg"
  }

}

resource "aws_instance" "l124" {
    ami = var.aws_instance
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.l124_security.id]
    tags = {
      Name = "l124"
    }
  
}   