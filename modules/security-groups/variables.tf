variable "mysql_ingress_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "wordpress_ingress_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "region" {
  type        = string
  default     = "us-east-1"
}