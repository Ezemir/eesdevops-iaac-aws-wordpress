terraform {
  required_version = ">= 1.9.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }
}

resource "aws_db_instance" "wordpress" {
  identifier             = "wordpress"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "eesdevops"
  password               = "eesdevops"
  db_name                = "wordpress"
  skip_final_snapshot    = true
  parameter_group_name   = "default.mysql8.0"
  vpc_security_group_ids = [var.mysql_sg_id]

}
