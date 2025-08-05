terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = "1.12.2"
}

resource "null_resource" "null" {

  triggers = {
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = "echo Hello, World!"
  }

  provisioner "local-exec" {
    command = "echo $FOO $BAR $TIME >> env_vars.txt"

    environment = {
      FOO  = "foo"
      BAR  = "bar"
      TIME = timestamp()
    }
  }
}
