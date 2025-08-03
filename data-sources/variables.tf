variable "env" {

}

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

  validation {
    condition     = length(var.instance_ami) > 4 && substr(var.instance_ami, 0, 4) == "ami-"
    error_message = "The instance ami must be valid"
  }
}

variable "instance_number" {
  type = object({
    dev  = number
    prod = number
  })

  default = {
    dev  = 1
    prod = 1
  }
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