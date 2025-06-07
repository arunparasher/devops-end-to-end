provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Allow SSH, HTTP, HTTPS, and Jenkins traffic"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "my-security-group"
  }
}

resource "aws_instance" "my_ec2" {
  for_each               = toset(["Jenkins-master", "Build-slave", "Ansible"])  # Corrected
  ami                    = "ami-0731becbf832f281e"
  instance_type          = "t3.medium"
  key_name               = "lab"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = each.key  # Correct syntax
  }
}
