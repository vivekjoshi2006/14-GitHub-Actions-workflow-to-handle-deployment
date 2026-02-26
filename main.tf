provider "aws" {
  region = "us-east-1"
}

# 1. ECS Cluster
resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

# 2. Use EXISTING ECR Repository (No more AlreadyExists error!)
data "aws_ecr_repository" "strapi_app" {
  name = "strapi-app"
}

# 3. ECS Service
resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service-v3" # New name to bypass any old locks
  cluster         = aws_ecs_cluster.strapi_cluster.id
  task_definition = "strapi-task" 
  desired_count   = 1
  launch_type     = "FARGATE"

  deployment_controller {
    type = "ECS" 
  }

  network_configuration {
    subnets          = ["subnet-077310516cd53e746", "subnet-03328ca5b606c3a5f"]
    assign_public_ip = true
    security_groups  = ["sg-0f0f8aa3d2b7d5e9c"]
  }

  lifecycle {
    ignore_changes = [task_definition] 
  }
}