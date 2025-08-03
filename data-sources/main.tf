terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = "1.12.2"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "my_ec2" {
  ami = var.instance_ami

  instance_type = data.aws_ami.ubuntu.id

  tags = {
    Project = "Curso Terraform"

    Env  = format("%s", var.env)
  }
}

data "terraform_remote_state" "server" {
  backend = "s3"

  config = {
    bucket  = "tfstate-968339500772"
    key     = "dev/03-data-sources-s3/terraform.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}