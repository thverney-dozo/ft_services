#!/bin/bash

minikube delete

minikube config set vm-driver virtualbox

minikube start --cpus=2 --memory 4000
minikube addons enable ingress
minikube addons enable dashboard

eval $(minikube docker-env)
docker build -t nginx_alpine srcs/nginx/
docker build -t mysql_alpine srcs/mysql/
docker build -t wordpress_alpine srcs/wordpress/


kubectl apply -f srcs/nginx-deployment.yaml
kubectl apply -f srcs/ingress.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
