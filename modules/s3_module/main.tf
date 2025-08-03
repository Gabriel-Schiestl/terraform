resource "aws_s3_bucket" "this" {
  bucket = var.name

  tags = var.tags
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.bucket

  acl = var.acl
}

resource "aws_s3_bucket_website_configuration" "this" {
  count  = len(keys(var.website)) > 0 ? 1 : 0
  bucket = aws_s3_bucket.this.bucket

  dynamic "index_document" { # criar ou nao o modulo(array vazio nao cria)
    for_each = lookup(var.website, "index_document", null) != null ? [1] : []
    content {
      suffix = lookup(var.website, "index_document", "index.html")
    }
  }

  dynamic "error_document" {
    for_each = lookup(var.website, "error_document", null) != null ? [1] : []
    content {
      key = lookup(var.website, "error_document", "error.html")
    }
  }

  dynamic "redirect_all_requests_to" {
    for_each = lookup(var.website, "redirect_all_requests_to", null) != null ? [1] : []
    content {
      host_name = lookup(var.website, "redirect_all_requests_to", null)
    }
  }

  dynamic "routing_rule" {
    for_each = lookup(var.website, "routing_rules", null) != null ? [lookup(var.website, "routing_rules", null)] : []
    content {
      condition {
        key_prefix_equals = lookup(routing_rule.value, "key_prefix_equals", null)
      }
      redirect {
        replace_key_with = lookup(routing_rule.value, "replace_key_with", null)
      }
    }
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.bucket

  dynamic "versioning_configuration" {
    for_each = length(keys(var.versioning)) == 0 ? [] : [var.versioning]

    content {
      mfa_delete = lookup(versioning_configuration.value, "mfa_delete", null)
      status     = lookup(versioning_configuration.value, "status", null)
    }
  }
}

module "object" {
  source = "./s3_object"

  for_each = var.files != "" ? fileset(var.files, "**") : []

  bucket = aws_s3_bucket.this.bucket

  key = "${var.key_prefix}/${each.value}"

  src = "${var.files}/${each.value}"
}