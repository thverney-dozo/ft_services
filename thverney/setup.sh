#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

minikube config set vm-driver virtualbox

minikube start --cpus=2 --memory 4000 --disk-size 11000 --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable dashboard
minikube addons enable metallb

printf "${RED}✓	Minikube start successful${NC}\n"

eval $(minikube docker-env)

docker build -t nginx_alpine srcs/nginx/
docker build -t mysql_alpine srcs/mysql/
docker build -t phpmyadmin_alpine srcs/phpmyadmin/
docker build -t wordpress_alpine srcs/wordpress/
printf "${RED}✓   All docker build successful${NC}\n"


kubectl apply -k srcs
kubectl describe cm config -n metallb-system
# kubectl apply -f srcs/metallb-config.yaml
# kubectl apply -f srcs/nginx-deployment.yaml
# kubectl apply -f srcs/mysql.yaml
# kubectl apply -f srcs/phpmyadmin.yaml
# kubectl apply -f srcs/wordpress.yaml
# kubectl delete --all deployments
# kubectl delete --all pods
# kubectl delete --all services
# kubectl delete --all pvc

printf "${RED}✓  All yaml successfuly applied${NC}\n"
