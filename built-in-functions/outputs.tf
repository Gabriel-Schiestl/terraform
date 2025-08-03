output "instance_public_ips" {
  value = aws_instance.my_ec2.*.public_ip
}

output "instance_name" {
  value = join(", ", aws_instance.my_ec2.*.tags.name)
}