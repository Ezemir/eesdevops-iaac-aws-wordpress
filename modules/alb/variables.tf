variable "subnet_ids" {
  type        = list(string)
}
variable "alb_security_group_id" {
  type        = string
}

variable "vpc_id" {
  type        = string
}

variable "wordpress_instance_id" {
  type        = string
}
