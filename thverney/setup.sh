#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color

if ! minikube status >/dev/null 2>&1
then
    if [[ $OSTYPE == "darwin"* ]]
    then
        if ! minikube start --vm-driver=virtualbox --cpus 3 --disk-size=30000mb --memory=3000mb --bootstrapper=kubeadm
        then
            echo Cannot start minikube!
            exit 1
        fi
    else
      if ! minikube start --vm-driver=docker --bootstrapper=kubeadm
        then
            echo Cannot start minikube!
            exit 1
        fi
	fi
fi

minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

printf "${RED}✓	Minikube start successful${NC}\n"

eval $(minikube docker-env)

docker build -t nginx_alpine srcs/nginx/
docker build -t mysql_alpine srcs/mysql/
docker build -t phpmyadmin_alpine srcs/phpmyadmin/
docker build -t wordpress_alpine srcs/wordpress/
docker build -t grafana_alpine srcs/grafana/
docker build -t influxdb_alpine srcs/influxdb/
docker build -t ftps_alpine srcs/ftps

printf "${RED}✓   All docker build successful${NC}\n"


kubectl apply -k srcs
kubectl describe cm config -n metallb-system

printf "${RED}✓  All yaml successfuly applied${NC}\n"

minikube dashboard