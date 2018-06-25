#!/bin/bash

kubectl create namespace exercise

kubectl create -f cm.yaml

kubectl create secret generic database-credentials -n exercise \
--from-literal=root-password=mariapower \
--from-literal=wp-dbname=wordpress \
--from-literal=wp-user=wordpress \
--from-literal=wp-password=wordpresspower
kubectl create secret generic wp-credentials -n exercise \
--from-literal=user=kubernetes \
--from-literal=password=training

kubectl create -f mariadb-deployment.yaml
kubectl create -f mariadb-svc.yaml

kubectl create -f wordpress-deployment.yaml
kubectl create -f wordpress-svc.yaml

minikube addons enable ingress
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/CN=wordpress.exercise.com" -keyout wordpress.key -out wordpress.crt
kubectl create secret tls sslcerts --namespace="exercise" --key wordpress.key --cert wordpress.crt
kubectl create -f ingress.yaml
echo "$(minikube ip)   wordpress.exercise.com" | sudo tee -a /etc/hosts
