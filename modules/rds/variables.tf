variable "db_name" {
  description = "Wordpress"
  type        = string
  default     = "wordpress"
}
variable "db_username" {
  description = "Nome de usuário do banco de dados"
  type        = string
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
}


variable "db_instance_class" {
  description = "Classe da instância do banco de dados"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "Tamanho (em GB)"
  type        = number
  default     = 20
}

variable "mysql_sg_id" {
  description = "ID do Security Group para o MySQL"
  type        = string
}

