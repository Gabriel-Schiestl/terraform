terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }
  }

  required_version = "1.12.2"
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "my_ec2" {
  ami = var.instance_ami
  
  instance_type = var.instance_type

  tags = var.instance_tags
}

