terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket = "value_from_remote_state"

    key    = "terraform.tfstate"

    region = var.aws_region

    profile = var.aws_profile

    dynamodb_table = "tflock-${var.bucket_name}"
  }

  required_version = "1.12.2"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}