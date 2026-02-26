# GitHub-Actions-workflow-to-handle-deployment
Push the pre-built Docker image to Amazon ECR, tagged with the GitHub commit SHA. Update the ECS Task Definition with the new image tag dynamically. Trigger an AWS CodeDeploy deployment to roll out the updated ECS service. Optionally, monitor deployment status and initiate rollback if the deployment fails. 
