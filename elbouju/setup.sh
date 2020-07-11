#!/bin/bash

minikube delete

minikube config set vm-driver virtualbox

minikube start --cpus=2 --memory 4000 --disk-size 11000 --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable dashboard

printf "✓	Minikube start successful\n"

eval $(minikube docker-env)

docker build -t nginx_alpine srcs/nginx/
docker build -t mysql_alpine srcs/mysql/
docker build -t wordpress_alpine srcs/wordpress/

printf "✓   All docker build successful\n"

kubectl apply -f srcs/nginx-deployment.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/metallbconf.yaml

printf "✓  All yaml successfuly applied\n"
