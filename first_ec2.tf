terraform{
  required_providers{
    aws = {
      source = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
region = "us-west-2"
access_key = "AKIAT4FDAEWY2OAZ2JOX"
secret_key = "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"
}

resource "aws_key_pair" "loginkey" {
  key_name = "mynew_keypair1"
  public_key = file("C:\\Users\\Vinzi\\.ssh\\id_rsa.pub")

}

resource aws_security_group "linuxgrp"{
  name = "mynewSG"

  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "myec2" {
  ami = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"
  key_name = aws_key_pair.loginkey.key_name
  security_groups = [aws_security_group.linuxgrp.name]

  tags = {
    Name = "firstinstance"
  }
}

output "myec2details"{
  value = [aws_instance.myec2.public_ip]
}
