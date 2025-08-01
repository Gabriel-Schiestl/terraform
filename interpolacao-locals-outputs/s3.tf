resource "aws_s3_bucket" "my_s3" {
  bucket = "${random_pet.bucket.id}-${var.environment}"

  tags = local.common_tags
}

resource "aws_s3_object" "this" { # adicionar objeto ao S3
  bucket = aws_s3_bucket.my_s3.bucket

  key = "config/${local.ip_filepath}" # onde será salvo

  source = local.ip_filepath # fonte do arquivo

  etag = filemd5(local.ip_filepath) # calcula quando o arquivo foi modificado e teve alteração
}