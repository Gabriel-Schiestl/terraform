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
  region = "us-east-1"
  profile = "tf01"
}

resource "aws_s3_bucket" "my_s3" {
  bucket = "my-tf-test-bucket-123123123124235234"
  
  tags = {
    Name = "My TF Test Bucket"
    Environment = "Dev"
    Owner = "Gabriel Schiestl"
    UpdatedAt = "2025-07-30"
  }
}