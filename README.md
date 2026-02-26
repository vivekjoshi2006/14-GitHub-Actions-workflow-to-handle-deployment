# Strapi CMS: Automated AWS Deployment

This repository contains a fully containerized **Strapi CMS** application with a complete **CI/CD pipeline** for automated deployment to **AWS ECS Fargate**.

## 🚀 Key Features

* **Infrastructure as Code (IaC):** Managed using **Terraform** to ensure reproducible and version-controlled cloud environments.
* **Automated CI/CD:** Integrated **GitHub Actions** pipeline for seamless "Push-to-Deploy" functionality.
* **Containerization:** Optimized **Docker** configuration for Strapi, hosted on **Amazon ECR**.
* **Serverless Architecture:** Hosted on **AWS ECS Fargate**, eliminating the need for manual EC2 instance management and reducing overhead.
* **Zero-Downtime Updates:** Utilizes a **Rolling Update** strategy to keep the application live during new deployments.

## 🛠️ Tech Stack

* **Framework:** Strapi CMS
* **Cloud Provider:** AWS (ECS, ECR, Fargate, IAM)
* **DevOps Tools:** Terraform, GitHub Actions, Docker

## 📂 Project Structure

* `.github/workflows/deploy.yml`: The main CI/CD pipeline definition.
* `main.tf`: Terraform configuration for AWS infrastructure.
* `.aws/task-def.json`: ECS Task Definition blueprint.
* `Dockerfile`: Containerization instructions for the Strapi app.

## ⚙️ How It Works

1. **Continuous Integration:** On every push to the `main` branch, GitHub Actions builds a new Docker image.
2. **Image Storage:** The image is tagged and pushed to **Amazon Elastic Container Registry (ECR)**.
3. **Continuous Deployment:** The pipeline updates the **ECS Task Definition** with the new image and triggers a deployment to the **ECS Service**.
4. **Health Monitoring:** AWS ECS performs health checks to ensure the new version is stable before decommissioning the old containers.
