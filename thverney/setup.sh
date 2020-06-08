#!/bin/bash

minikube delete

minikube config set vm-driver virtualbox

minikube start --cpus=2 --memory 4000
minikube addons enable ingress
minikube addons enable dashboard

eval $(minikube docker-env)
docker build -t nginx_alpine srcs/

kubectl apply -f srcs/ingress.yaml
kubectl apply -f srcs/nginx-deployment.yaml
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml




