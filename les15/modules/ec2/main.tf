
resource "aws_instance" "l124" {
    ami = "ami-09cd747c78a9add63"
    instance_type = "t2.micro"
    #subnet_id = aws_subnet.l124_public_subnet.id
    #vpc_security_group_ids = [aws_security_group.l124_security.id]
    
    tags = {
      Name = "l124_dev"
    }
  
}   