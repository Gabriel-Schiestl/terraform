terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    
  }

  required_version = "1.12.2"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}