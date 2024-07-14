terraform {
  required_version = ">= 1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "ubuntu_instance" {
  ami                          = var.ami_id
  instance_type                = var.instance_type
  vpc_security_group_ids       = [var.wordpress_sg_id, var.mysql_sg_id]
  associate_public_ip_address  = true

  tags = {
    Name = var.instance_name
  }

  user_data = templatefile("${path.module}/scripts/install.sh", {
    db_host = var.db_host
  })

  depends_on = [var.db_host]

}
