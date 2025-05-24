#!/bin/bash
set -e

# Get the AWS account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=${AWS_REGION:-us-east-1}
ECR_REPOSITORY=${ECR_REPOSITORY:-next-docker}
IMAGE_TAG=${IMAGE_TAG:-latest}

echo "Building Docker image..."
docker build -t $ECR_REPOSITORY:$IMAGE_TAG .

# Tag the image for ECR
echo "Tagging image for ECR..."
docker tag $ECR_REPOSITORY:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

echo "Docker image built and tagged successfully"