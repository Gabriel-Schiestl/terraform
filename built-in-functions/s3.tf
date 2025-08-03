resource "random_pet" "this" {
  length = 5
}

resource "aws_s3_bucket" "this" {
  bucket = "${random_pet.this.id}-${var.env}"

  tags = local.common_tags
}

resource "aws_s3_object" "this" {
  key = "${uuid()}.${local.file_ext}"

  bucket = aws_s3_bucket.this.bucket

  source = data.archive_file.json.output_path

  etag = filemd5(data.archive_file.json.output_path)

  content_type = "application/json"

  tags = local.common_tags
}