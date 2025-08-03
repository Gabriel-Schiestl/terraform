terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = "1.12.2"
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "my_ec2" {
  count = local.instance_number <= 0 ? 0 : local.instance_number # condicional

  ami = var.instance_ami

  instance_type = var.instance_type

  tags = merge(local.common_tags, { # unificar objects(maps)
    Project = "Curso Terraform"

    Env  = format("%s", var.env)
    Name = format("Instance %d", count.index + 1) # printf do C
  })
}

locals {
  instance_number = lookup(var.instance_number, var.env) # procurar uma chave em um map, retornando o valor dela

  common_tags = {
    "Owner" = "Gabriel Schiestl"
  }

  file_ext = "zip"

  object_name = "meu-arquivo-gerado-de-um-template"
}