output "db_host" {
  value = aws_db_instance.wordpress.endpoint
}

output "db_username" {
  value = var.db_username
}

output "db_password" {
  value = var.db_password
}