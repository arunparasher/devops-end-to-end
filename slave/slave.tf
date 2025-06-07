provider "aws" {
  region = "us-east-1"
}

# Lookup existing security group by name
data "aws_security_group" "my_sg" {
  filter {
    name   = "my-security-group"
    values = ["my-security-group"]  # Replace with your SG name
  }

  # Optional: VPC ID if needed
  # vpc_id = "vpc-xxxxxxxx"
}

resource "aws_instance" "my_ec2_1" {
  ami                    = "ami-0731becbf832f281e"
  instance_type          = "t3.medium"
  key_name               = "lab"  # Replace with your actual key pair
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  tags = {
    Name = "Terraform-EC2_Slave"
  }
}