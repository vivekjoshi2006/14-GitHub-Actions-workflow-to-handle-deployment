provider "aws" {
  region = "us-east-1"
}

# 1. ECS Cluster
resource "aws_ecs_cluster" "strapi_cluster" {
  name = "strapi-cluster"
}

# 2. ECR Repository 
resource "aws_ecr_repository" "strapi_app" {
  name                 = "strapi-app"
  force_delete         = true
  image_tag_mutability = "MUTABLE"
}

# 3. ECS Service
resource "aws_ecs_service" "strapi_service" {
  name            = "strapi-service"
  cluster         = aws_ecs_cluster.strapi_cluster.id
  task_definition = "strapi-task" 
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["subnet-077310516cd53e746", "subnet-03328ca5b606c3a5f"]
    assign_public_ip = true
    security_groups  = ["sg-0f0f8aa3d2b7d5e9c"]
  }

  lifecycle {
    ignore_changes = [task_definition] 
  }
}