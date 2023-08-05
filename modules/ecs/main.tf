# ECS Cluster
resource "aws_ecs_cluster" "app_cluster" {
  name = "northstar-cluster"
}

# ECS Task Definition for Web Tier
resource "aws_ecs_task_definition" "web_task" {
  family                   = "web"
  container_definitions    = file("web-container-definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
}

# ECS Service for Web Tier
resource "aws_ecs_service" "web_service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.web_task.arn
  desired_count   = 2
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.web_subnet_ids
    security_groups  = [var.web_security_group_id]
    assign_public_ip = true
  }
}

# Repeat similar blocks for App and Data Tiers with appropriate task definitions and configurations

# Additional resources as needed, such as load balancers, scaling policies, etc.
