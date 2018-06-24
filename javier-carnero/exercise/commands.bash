kubectl create namespace exercise

kubectl create -f cm.yaml

kubectl create secret generic mariadb --namespace="exercise" --from-literal=password=mariapower
kubectl create secret generic wordpressdb --namespace="exercise" --from-literal=password=wordpresspower
kubectl create secret generic wordpress --namespace="exercise" --from-literal=password=training

kubectl create -f mariadb-deployment.yaml
kubectl create -f mariadb-svc.yaml

kubectl create -f wordpress-deployment.yaml
kubectl create -f wordpress-svc.yaml

#minikube addons enable ingress
kubectl create -f ingress.yaml
echo "$(minikube ip)   wordpress.exercise.com" | sudo tee -a /etc/hosts