variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default = "vpc-0f1cc9c32a9e43919"
}

variable "db_username" {
  description = "Nome de usuário do banco de dados"
  type        = string
  default = "eesdevops"
}

variable "db_password" {
  description = "Senha do banco de dados"
  type        = string
  default = "eesdevops"
}