#if [ $# -lt 1 ]; then
#    echo "No overlay specified, please specify an overlay from bootstrap/overlays"
#    exit 1
#else
#    OVERLAY=$1
#    echo "Configuring cluster ${OVERLAY}"
#fi

# minikube delete --purge
# minikube start
# minikube addons enable ingress
# curl -sL https://github.com/operator-framework/operator-lifecycle-manager/releases/download/v0.22.0/install.sh | bash -s v0.22.0



kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd/monitoring.coreos.com_prometheusagents.yaml
kubectl create -f https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v0.66.0/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml
kustomize build bootstrap/base --enable-alpha-plugins --enable-helm | kubectl apply -f -
sleep 60
#kubectl wait --for condition=established crd application.argoproj.io
kustomize build bootstrap/overlays/home --enable-alpha-plugins  --enable-helm | kubectl apply -f -

# minikube tunnel --bind-address='172.20.24.247'
#kubectl create namespace argocd
#kubectl create namespace patch-operator
#kubectl create namespace monitoring

#helm repo add stable https://charts.helm.sh/stable
#helm repo add patch-operator https://redhat-cop.github.io/patch-operator
#helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

#helm repo update
#helm -n monitoring install stable prometheus-community/kube-prometheus-stack
#helm install patch-operator patch-operator/patch-operator

#kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.10.0/cert-manager.yaml
#kubectl create -f https://operatorhub.io/install/flux.yaml

#kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#kustomize build bootstrap/overlays/home | kubectl apply -f -

# kubectl -n kubernetes-dashboard get secret admin-user-token -o yaml | yq e '.data.token' |base64 -d
#kubectl proxy

#sleep 60
#kubectl port-forward svc/argocd-server -n argocd 8080:443


# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
# kubectl -n kubernetes-dashboard create token admin-user
# Allows HTTP streaming from Gitter
# camel.main.streamCachingEnabled=false

# # On shutdown it reduces waiting time when stoping Camel's streaming listener
# camel.main.shutdownTimeout = 5


# extras on nodes
# sudo apt-get install linux-modules-extra-raspi -y
# sudo apt-get install nfs-common
# sudo sysctl -w vm.max_map_count=262144


# kubectl get secret elasticsearch-es-elastic-user -o go-template='{{.data.elastic | base64decode}}' -n elasticsearch-worker

# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

# kubectl -n kubernetes-dashboard get secret admin-user-token -o yaml | yq e '.data.token' |base64 -d




# sudo pvcreate /dev/mmcblk0p3
# sudo vgcreate volgrp01 /dev/mmcblk0p3
# sudo lvcreate --name lv01 -l 100%FREE volgrp01

# ceph-volume lvm prepare --bluestore --data /dev/volgrp01/lv01

#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.101"
#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.102"
#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.103"
#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.104"
#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.105"
#   ssh-keygen -f "~/.ssh/known_hosts" -R "10.0.4.106"