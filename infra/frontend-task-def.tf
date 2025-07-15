resource "aws_ecs_task_definition" "frontend_task" {
  family                   = "pgagi-frontend-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name      = "pgagi-frontend"
      image     = "${var.aws_account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.frontend_ecr_repo}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
      ],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          awslogs-group         = "/ecs/pgagi-frontend-task",
          awslogs-region        = var.region,
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

