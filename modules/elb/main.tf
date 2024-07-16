resource "aws_lb" "wordpress_lb" {
  name               = "wordpress-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.elb_sg_id]
  subnets            = var.elb_subnets
  enable_deletion_protection = false
  vpc_id             = "vpc-0f1cc9c32a9e43919" 

  tags = {
    Name = "wordpress-lb"
  }
}

resource "aws_lb_listener" "wordpress_listener" {
  load_balancer_arn = aws_lb.wordpress_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Healthy"
      status_code  = "200"
    }
  }
}