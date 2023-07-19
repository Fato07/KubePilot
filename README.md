# KubePilot

## Goal

Create a EKS cluster, with a node group of 4 nodes. Create two names paces for dev and prod.

Create a dummy application that is containerized, has health check endpoints for liveness and readiness probes.

Develop a pipeline that builds this app and stores the image in ecr, and deploys to the dev and prod namespace.

The app should then display the current environment it's in, and the commit sha of the image tag.


###
The docker_build_and_push.yml file is a GitHub Actions workflow file that automates the process of building a Docker image and pushing it to a container registry (such as Amazon ECR). It includes steps for building the Docker image, tagging it with a specific version or tag, and pushing it to the container registry. This workflow is specifically focused on the Docker build and push process and is executed within the GitHub Actions environment.

###
The terraform.yml file is a GitHub Actions workflow file that focuses on automating the deployment of infrastructure using Terraform. It includes steps for checking out the code, configuring AWS credentials, setting output variables, and applying the Terraform configuration. This workflow is specifically designed for deploying infrastructure using Terraform and is executed within the GitHub Actions environment.