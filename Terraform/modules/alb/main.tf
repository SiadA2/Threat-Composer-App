# Create alb
resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = var.public_subnets_id
  security_groups = [var.security_groups]
}

# Create target group
resource "aws_alb_target_group" "app" {
  name        = var.target_group_name
  port        = var.http_port
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = var.protocol
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all HTTP traffic to port 443 on the alb via HTTPS
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.arn
  port              = var.http_port
  protocol          = var.protocol

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}

# Forward HTTPS traffic to the target group
resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_alb.main.arn
  port              = var.https_port
  protocol          = "HTTPS"
  certificate_arn   = var.certificate_arn

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = var.forward_action
  }
}