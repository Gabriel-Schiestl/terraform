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

resource "aws_dynamodb_table" "lock-table" {
  name = "tflock-${aws_s3_bucket.this.bucket}"

  read_capacity = 5

  write_capacity = 5

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
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