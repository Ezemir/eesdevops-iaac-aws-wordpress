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
  region = "us-east-1"
}

module "security_groups" {
  source = "./modules/security-groups"

  mysql_ingress_cidr     = ["0.0.0.0/0"]
  wordpress_ingress_cidr = ["0.0.0.0/0"]
  region                 = "us-east-1"
}

module "rds" {
  source               = "./modules/rds"
  db_name              = "wordpress-db"
  db_username          = "eesdevops"
  db_password          = "eesdevops"
  db_instance_class    = "db.t3.micro"
  db_allocated_storage = 20
  mysql_sg_id          = module.security_groups.mysql_sg_id
}

module "ec2" {
  source          = "./modules/ec2"
  region          = "us-east-1"
  ami_id          = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  instance_name   = "ubuntu-24.04"
  mysql_sg_id     = module.security_groups.mysql_sg_id
  wordpress_sg_id = module.security_groups.wordpress_sg_id
  db_host         = module.rds.db_host
}
