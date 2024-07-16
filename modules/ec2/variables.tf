variable "region" {
  type = string
  default = "us-east-1"
}
variable "ami_id" {
  type    = string
  default = "ami-04a81a99f5ec58529"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "instance_name" {
  type    = string
  default = "ubuntu-24.04"
}
variable "mysql_sg_id" {
  type = string
}
variable "wordpress_sg_id" {
  type = string
}
variable "db_host" {
  type = string
}
variable "db_username" {
  type    = string
  default = "eesdevops"
}
variable "db_password" {
  type    = string
  default = "eesdevops"
}
