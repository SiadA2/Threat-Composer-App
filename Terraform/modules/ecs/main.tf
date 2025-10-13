resource "aws_ecs_cluster" "main" {
    name = "cb-cluster"
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role_name
}

# Task definition
resource "aws_ecs_task_definition" "app" {
    family                   = "cb-app-task"
    execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.fargate_cpu
    memory                   = var.fargate_memory
    container_definitions    = jsonencode([
    {
      "cpu": 0,
      "environment": [],
      "environmentFiles": [],
      "essential": true,
      "image": "174350032095.dkr.ecr.eu-west-2.amazonaws.com/siada2/ecs@sha256:71313e1b4fa590b301397f35958f8ffa3dc4375c20c6e63f6c247cc7d55ac483",
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/task-def-1",
          "awslogs-create-group": "true",
          "awslogs-region": "eu-west-2",
          "awslogs-stream-prefix": "ecs"
        },
        "secretOptions": []
      },
      "mountPoints": [],
      "name": "tm-1",
      "portMappings": [
        {
          "appProtocol": "http",
          "containerPort": 3000,
          "hostPort": 3000,
          "name": "tm-1-3000-tcp",
          "protocol": "tcp"
        }
      ],
      "systemControls": [],
      "ulimits": [],
      "volumesFrom": []
    }

  ])
}

# ECS service
resource "aws_ecs_service" "main" {
    name            = "cb-service"
    cluster         = aws_ecs_cluster.main.id
    task_definition = aws_ecs_task_definition.app.arn
    desired_count   = var.app_count
    launch_type     = "FARGATE"

    network_configuration {
        security_groups  = [var.ecs_security_group_id]
        subnets          = var.private_subnet_id
        assign_public_ip = true
    }

    load_balancer {
        target_group_arn = var.alb_target_grp_arn
        container_name   = "tm-1"
        container_port   = var.app_port
    }
}

