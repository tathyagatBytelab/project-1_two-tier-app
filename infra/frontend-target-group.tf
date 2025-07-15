resource "aws_lb_target_group" "frontend_tg" {
  name     = "pgagi-frontend-tg"
  port     = 3000
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.main.id
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
