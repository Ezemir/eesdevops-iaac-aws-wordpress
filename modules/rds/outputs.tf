output "db_host" {
  description = "Endpoint da instância RDS MySQL"
  value       = aws_db_instance.wordpress-db.endpoint
}

output "mysql_sg_id" {
  description = "ID do grupo de segurança MySQL"
  value       = var.mysql_sg_id
}