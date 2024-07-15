variable "mysql_ingress_cidr" {
  description = "Bloco CIDR para ingresso MySQL"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "wordpress_ingress_cidr" {
  description = "Bloco CIDR para ingresso WordPress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}



