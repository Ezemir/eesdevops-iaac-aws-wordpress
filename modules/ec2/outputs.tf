# output "ec2_public_ip" {
#   value = aws_instance.ubuntu_instance.ec2_public_ip
# }
output "db_username" {
  value = var.db_username
}
output "db_password" {
  value = var.db_password
}
output "wordpress_instance_id" {
  value       = aws_instance.wordpress_instance.id
}
