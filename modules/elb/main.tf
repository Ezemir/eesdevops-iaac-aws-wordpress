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
locals {
  subnet_ids            = var.subnet_ids
  elb_security_group_id = var.elb_security_group_id
  vpc_id                = var.vpc_id
}
resource "aws_elb" "wordpress_elb" {
  name            = "wordpress-elb"
  subnets         = local.subnet_ids
  security_groups = [local.elb_security_group_id]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_lb_target_group" "wordpress_tg" {
  name     = "wordpress-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 10
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_lb_target_group_attachment" "wordpress_tg_attachment" {
  target_group_arn = aws_lb_target_group.wordpress_tg.arn
  target_id        = var.wordpress_instance_id
  port             = 80
}
