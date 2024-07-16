output "elb_dns_name" {
  description = "DNS Name do ELB"
  value       = aws_lb.wordpress_lb.dns_name
}

output "elb_arn" {
  description = "ARN do ELB"
  value       = aws_lb.wordpress_lb.arn
}
