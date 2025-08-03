variable "name" {
  type = string

  description = "Bucket name"
}

variable "acl" {
  type = string

  description = "Bucket acl"

  default = "private"
}

variable "policy" {
  type = string

  description = "Bucket policy"

  default = null
}

variable "tags" {
  type = map(string)

  description = "Bucket tags"

  default = {
    "name" = "bucket name"
  }
}

variable "website" {
  type    = string
  default = ""
}

variable "files" {
  type    = string
  default = ""
}

variable "key_prefix" {
  type    = string
  default = ""
}

variable "versioning" {
  type    = map(string)
  default = {}
}