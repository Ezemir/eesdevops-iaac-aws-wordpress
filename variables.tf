variable "region" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "db_username" {
  type = string
}
variable "db_password" {
  type = string
}
variable "db_name" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "alb_security_group_id" {
  type = string
}

variable "ami_id" {
  type = string
}
variable "db_instance_class" {
  type = string
}

variable "instance_name" {
  type = string
}
variable "instance_type" {
  type = string
}
