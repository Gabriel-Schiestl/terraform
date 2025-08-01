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
  region = "us-east-1"
  profile = "tf01"
}

resource "random_pet" "bucket" {
  length = 5
}

resource "aws_s3_bucket" "this" {
    bucket = "remote-state-${random_pet.bucket.id}"

    tags = {
        Name = "remote state"
    }
}

resource "aws_s3_bucket_versioning" "remote_state" {
    bucket = aws_s3_bucket.this.id

    versioning_configuration {
        status = "Enabled"
    }
}

output "aws_bucket_id" {
  value = aws_s3_bucket.this.id
}

output "aws_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "aws_bucket_arn" {
  value = aws_s3_bucket.this.arn
}