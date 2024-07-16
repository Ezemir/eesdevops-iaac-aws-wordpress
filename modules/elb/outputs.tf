output "elb_dns_name" {
  description = "DNS Name do ELB"
  value       = aws_elb.wordpress_elb.dns_name
}



