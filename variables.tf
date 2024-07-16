variable "region" {
  type        = string
  default     = "us-east-1"
}
variable "vpc_id" {
  type        = string
  default = "vpc-0f1cc9c32a9e43919"
}
variable "db_username" {
  type        = string
  default = "eesdevops"
}
variable "db_password" {
  type        = string
  default = "eesdevops"
}
variable "subnet_ids" {
  type        = list(string)
}
variable "elb_security_group_id" {
  type        = string
}

