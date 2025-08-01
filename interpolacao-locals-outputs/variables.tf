variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "tf01"
}


variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-08a6efd148b1f7504"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}

variable "instance_tags" {
  type        = map(string)
  description = ""
  default = {
    Name    = "Ubuntu"
    Project = "Teste Terraform"
  }
}

variable "environment" {
  type        = string
  description = "Environment for the resources"
  default     = "dev"
}