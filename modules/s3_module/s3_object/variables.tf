variable "bucket" {

}

variable "key" {

}

variable "src" {

}

variable "file_types" {
  type = map(string)
  default = {
    ".txt" = "text/plain; charset=utf-8"

    ".html" = "text/html; charset=utf-8"

    ".htm" = "text/html; charset=utf-8"

    ".xhtml" = "application/xhtml+xml; charset=utf-8"
  }
}

variable "default_file_type" {
  type    = string
  default = "application/octet-stream"
}