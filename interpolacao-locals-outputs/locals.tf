locals {
  common_tags = {
    Name        = "My TF Test Bucket"
    Environment = var.environment
    Owner       = "Gabriel Schiestl"
    UpdatedAt   = "2025-07-30"
  }

  ip_filepath = "ips.json"
}