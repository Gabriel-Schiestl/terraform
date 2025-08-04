resource "aws_instance" "remote_state" {
  instance_type = var.instance_type
  ami           = var.instance_ami
  tags          = var.instance_tags
}