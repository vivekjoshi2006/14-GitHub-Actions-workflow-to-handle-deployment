variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "The name of the EC2 key pair"
  type        = string
  default     = "strapi-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "docker_image" {
  description = "Docker image for Strapi"
  type        = string
  default     = "dockerhub-username/strapi-app:latest"
}
