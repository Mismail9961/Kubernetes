#!/bin/bash
set -e

NAME="kubernetes-demo-api"
USERNAME="ismail996"
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
docker build -t $IMAGE .

echo "Pushing image to Docker Hub..."
docker push $IMAGE

echo "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Waiting for pods..."
kubectl get pods

echo "Getting Services..."
kubectl get services

echo "Fetching Main Service..."
kubectl get service devops-kubernetes-api-service
