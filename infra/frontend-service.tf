resource "aws_ecs_service" "frontend_service" {
  name            = "pgagi-frontend-service"
  cluster         = aws_ecs_cluster.pgagi.id
  task_definition = aws_ecs_task_definition.frontend_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = aws_subnet.subnet_1[*].id
    assign_public_ip = true
    security_groups = [aws_security_group.ecs_sg.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.frontend_tg.arn
    container_name   = "pgagi-frontend"
    container_port   = 3000
  }

  depends_on = [
    aws_lb_listener.listener
  ]
}
