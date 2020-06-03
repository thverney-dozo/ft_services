#!/bin/bash

minikube delete

minikube config set vm-driver virtualbox

minikube start

kubectl apply -f srcs/nginx-deployment.yaml
