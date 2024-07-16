variable "subnet_ids" {
  description = "Lista de IDs das subnets onde o ELB será provisionado"
  type        = list(string)
}

variable "elb_security_group_id" {
  description = "ID do grupo de segurança para o ELB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "region" {
  type = string
  default = "us-east-1"
}

variable "wordpress_instance_id" {
  description = "The ID of the WordPress instance"
  type        = string
}
