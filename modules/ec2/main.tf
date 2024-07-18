resource "aws_instance" "wordpress_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.wordpress_sg_id, var.mysql_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  user_data = templatefile("${path.module}/scripts/install.sh", {
    DB_HOST     = var.db_host
    DB_USERNAME = var.db_username
    DB_PASSWORD = var.db_password
  })
}
