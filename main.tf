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

module "security_groups" {
  source = "./modules/security-groups"

  mysql_ingress_cidr     = ["0.0.0.0/0"]
  wordpress_ingress_cidr = ["0.0.0.0/0"]
  region                 = var.region
}

module "rds" {
  source               = "./modules/rds"
  db_name              = var.db_name
  db_username          = var.db_username
  db_password          = var.db_password
  db_instance_class    = var.db_instance_class
  db_allocated_storage = 20
  mysql_sg_id          = module.security_groups.mysql_sg_id
}

module "ec2" {
  source          = "./modules/ec2"
  ami_id          = var.ami_id
  instance_name   = var.instance_name
  instance_type   = var.instance_type
  mysql_sg_id     = module.security_groups.mysql_sg_id
  wordpress_sg_id = module.security_groups.wordpress_sg_id
  db_host         = module.rds.db_host
  db_username     = module.rds.db_username
  db_password     = module.rds.db_password
}

module "alb" {
  source                = "./modules/alb"
  subnet_ids            = var.subnet_ids
  alb_security_group_id = module.security_groups.wordpress_lb_sg_id
  vpc_id                = var.vpc_id
  wordpress_instance_id = module.ec2.wordpress_instance_id
}
