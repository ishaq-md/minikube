
#Install pre-requisites:
#Install kubectl 
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install kubectl -y

#Intsall snap
apt-get install snap
apt-get update


#Intsall microk8s
sudo snap install microk8s --classic
microk8s status --wait-ready
microk8s enable dashboard dns registry istio
microk8s kubectl get all --all-namespaces
microk8s dashboard-proxy

#Connect to dashboard via browser
microk8s kubectl get pods
microk8s kubectl expose pod petclinic-deployment-76ddc4c4f9-6zjps --name=petclinic-svc --port=8080 --type=NodePort
microk8s kubectl get service
