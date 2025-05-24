#!/bin/bash
set -e

# Get the AWS account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=${AWS_REGION:-us-east-1}
ECR_REPOSITORY=${ECR_REPOSITORY:-next-docker}
IMAGE_TAG=${IMAGE_TAG:-latest}

# Login to ECR
echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Check if repository exists, if not create it
aws ecr describe-repositories --repository-names $ECR_REPOSITORY --region $AWS_REGION || \
    aws ecr create-repository --repository-name $ECR_REPOSITORY --region $AWS_REGION

# Push the image to ECR
echo "Pushing image to ECR..."
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

echo "Image pushed successfully to ECR"