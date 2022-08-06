apt-get install -y snapd
sudo snap install microk8s --classic
sudo snap install microk8s --classic --channel=1.18/stable
sudo ufw allow in on cni0 && sudo ufw allow out on cni0
sudo ufw default allow routed
microk8s enable dns dashboard storage
microk8s kubectl get all --all-namespaces
token=$(microk8s kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
microk8s kubectl -n kube-system describe secret $token
microk8s kubectl -n kube-system describe secret $tokenhistory
microk8s dashboard-proxy



git clone https://github.com/bibinwilson/kubernetes-prometheus
microk8s kubectl create namespace monitoring
cd kubernetes-prometheus/
microk8s kubectl create -f config-map.yaml
microk8s kubectl create -f clusterRole.yaml
microk8s kubectl create -f prometheus-deployment.yaml
microk8s kubectl get deployments --namespace=monitoring
microk8s kubectl get pods --namespace=monitoring
microk8s kubectl create -f prometheus-service.yaml --namespace=monitoring
microk8s kubectl get service -n monitoring
git clone https://github.com/devopscube/kube-state-metrics-configs.git
kubectl apply -f kube-state-metrics-configs/
microk8s kubectl apply -f kube-state-metrics-configs/
kubectl get deployments kube-state-metrics -n kube-system
microk8s kubectl get deployments kube-state-metrics -n kube-system
