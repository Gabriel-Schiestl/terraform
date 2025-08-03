data "aws_ami" "ubuntu" {
  owners = ["amazon"]

  name_regex = "ubuntu"

  most_recent = true

  filter {
    name = "architecture"

    values = ["x86_64"]
  }
}

resource "aws_instance" "this" {
  for_each = {
    "web" = {
      name = "Web Server"
      type = "t2.micro"
    }

    "ci/cd" = {
      name = "CI/CD Server"
      type = "t2.micro"
    }
  }

  ami = data.aws_ami.ubuntu.id

  instance_type = lookup(each.value, "type", null)

  tags = {
    Name = "${each.key}: ${lookup(each.value, "name", null)}"
  }
}