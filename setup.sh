#!/bin/bash

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

if [[ $OSTYPE == "darwin"* ]]
then
	cp srcs/metallb-mac.yaml srcs/metallb-config.yaml
elif [[ $OSTYPE == "linux-gnu"* ]]
then
	cp srcs/metallb-linux.yaml srcs/metallb-config.yaml
fi

if [[ $OSTYPE == "darwin"* ]]
then
	cp srcs/wordpress/which/mac.sql srcs/wordpress/wordpress.sql
elif [[ $OSTYPE == "linux-gnu"* ]]
then
	cp srcs/wordpress/which/linux.sql srcs/wordpress/wordpress.sql
fi

minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl delete deployments --all
kubectl delete svc --all


eval $(minikube docker-env)

docker build -t nginx_alpine srcs/nginx/
docker build -t mysql_alpine srcs/mysql/
docker build -t phpmyadmin_alpine srcs/phpmyadmin/
docker build -t wordpress_alpine srcs/wordpress/
docker build -t grafana_alpine srcs/grafana/
docker build -t influxdb_alpine srcs/influxdb/
docker build -t ftps_alpine srcs/ftps


kubectl apply -k srcs
kubectl describe cm config -n metallb-system

rm -rf srcs/metallb-config.yaml
rm -rf srcs/wordpress/wordpress.sql

minikube dashboard

