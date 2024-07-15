output "mysql_sg_id" {
  description = "ID do grupo de segurança MySQL"
  value       = aws_security_group.mysql_sg.id
}

output "wordpress_sg_id" {
  description = "ID do grupo de segurança WordPress"
  value       = aws_security_group.wordpress_sg.id
}

output "wordpress_lb_sg_id" {
  value = aws_security_group.wordpress_lb.id
}
