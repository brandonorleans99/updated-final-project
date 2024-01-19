resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name

  setting {
    name  = var.ecs_cluster_setting_name
    value = var.ecs_cluster_setting_value
  }
}

resource "aws_ecs_service" "ecs_service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.cluster.name
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = var.ecs_desired_count
  deployment_minimum_healthy_percent = var.ecs_deployment_minimum_healthy_percent
  launch_type     = "FARGATE"

    network_configuration {
    subnets          = [aws_subnet.priv-sub[0].id, aws_subnet.priv-sub[1].id]  # Replace with your private subnet IDs. Always st
    security_groups  = [aws_security_group.testing-sg.id]  # Replace with your security group IDs
  }
}

# Define ECS Task Definitionls
resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = "my-app"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  execution_role_arn = aws_iam_role.test_role.arn

  container_definitions = jsonencode([{
    name  = "final_container"
    image = "nginx:latest"
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

