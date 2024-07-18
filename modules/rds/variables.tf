variable "db_name" {
  type        = string
  default     = "wordpress"
}
variable "db_username" {
  type        = string
}
variable "db_password" {
  type        = string
}
variable "db_instance_class" {
  type        = string
}
variable "db_allocated_storage" {
  type        = number
  default     = 20
}
variable "mysql_sg_id" {
  type        = string
}

