terraform{
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}


resource "aws_instance" "myec2" {
  ami = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"
  // key_name = aws_key_pair.loginkey.key_name
  // security_groups = [aws_security_group.linuxgrp.name]

  tags = {
    Name = "firstinstance"
  }
}

output "myec2details"{
  value = [aws_instance.myec2.public_ip]
}
