
output "ec2_public_ip" {
  value = aws_instance.ubuntu_instance.private_ip
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value = var.db_password
}
