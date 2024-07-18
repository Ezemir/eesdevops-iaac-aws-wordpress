resource "aws_db_instance" "wordpress" {
  identifier             = "wordpress"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true
  parameter_group_name   = "default.mysql8.0"
  vpc_security_group_ids = [var.mysql_sg_id]
}
