sudo apt-get update

sudo sudo apt install docker.io -y
sudo chmod 666 /var/run/docker. sock

sudo apt-get install -y apt-transport-https ca-certificates curl gpg
sudo mkdir -p -m 755 / etc/apt/keyrings

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring. gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/s
ources. list.d/kubernetes.list

sudo apt update

sudo apt install -y kubeadm+1.28.1-1.1 kubelet=1.28.1-1.1 kubect1=1.28.1-1.1

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

mkdir -p $HOME/ . kube
sudo cp -i / etc/kubernetes/admin.conf $HOME/. kube/config 
sudo chown $ (id -u) :$ (id -g) $HOME/. kube/config

kubectl apply -f https://docs.projectcalico.org/v3.20/manifests/calico.yaml
kubectl apply -f
https://raw.githubusercontent.com/kubernetes/ingress-nqinx/controller-v0.49.0/deploy/static/provider
/baremetal/deploy. yaml


https://github.com/Shopify/kubeaudit/releases
tar -xvzf kubeaudit linux
amd64. tar.gz
sudo mv kubeaudit /usr/local/bin/ kubeaudit al
