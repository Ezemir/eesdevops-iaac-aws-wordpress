output "mysql_sg_id" {
  description = "ID do grupo de segurança MySQL"
  value       = var.mysql_sg_id
}

output "db_host" {
  value = aws_db_instance.wordpress.endpoint
}

output "db_user" {
  value = aws_db_instance.wordpress.username
}

output "db_password" {
  value = aws_db_instance.wordpress.password
}
