variable "aws_region" {
  description = "The AWS region."
  type = object({
    dev  = string
    prod = string
  })

  default = {
    dev  = "us-west-2"
    prod = "us-east-1"
  }
}

variable "instance" {
  type = object({
    dev = object({
      ami    = string
      type   = string
      number = number
    })

    prod = object({
      ami    = string
      type   = string
      number = number
    })
  })

  default = {
    dev = {
      ami    = "ami-12345678"
      type   = "t2.micro"
      number = 1
    }
    prod = {
      ami    = "ami-87654321"
      type   = "t2.large"
      number = 2
    }
  }
}