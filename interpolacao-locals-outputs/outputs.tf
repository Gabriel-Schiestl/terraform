output "bucket_name" {
  value = aws_s3_bucket.my_s3.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.my_s3.arn

  description = "amazon resource name"
}

output "bucket_domain_name" {
  value = aws_s3_bucket.my_s3.bucket_domain_name
}

output "ips_filepath" {
  value = "${aws_s3_bucket.my_s3.bucket}/${aws_s3_object.this.key}"
}