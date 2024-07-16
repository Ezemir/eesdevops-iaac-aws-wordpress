variable "elb_sg_id" {
  description = "ID do Security Group para o ELB"
  type        = string
}

variable "elb_subnets" {
  description = "Lista de subnets onde o ELB será colocado"
  type        = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
