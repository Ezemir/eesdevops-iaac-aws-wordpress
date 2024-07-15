variable "region" {
  description = "Região AWS"
  type        = string
}

variable "ami_id" {
  description = "ID da AMI do Ubuntu 24.04"
  type        = string
  default     = "ami-04a81a99f5ec58529"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Nome da instância EC2"
  type        = string
  default     = "ubuntu-24.04"
}

variable "mysql_sg_id" {
  description = "ID do grupo de segurança do MySQL"
  type        = string
}

variable "wordpress_sg_id" {
  description = "ID do grupo de segurança do WordPress"
  type        = string
}

variable "db_host" {
  description = "Endpoint do RDS MySQL"
  type        = string
}

variable "db_user" {
  description = "Usuário do RDS MySQL"
  type        = string
}

variable "db_password" {
  description = "Senha do RDS MySQL"
  type        = string
}
