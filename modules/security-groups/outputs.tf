output "mysql_sg_id" {
  description = "ID do grupo de segurança MySQL"
  value       = aws_security_group.mysql_sg.id
}

output "wordpress_sg_id" {
  description = "ID do grupo de segurança WordPress"
  value       = aws_security_group.wordpress_sg.id
}
