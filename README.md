```
FROM ubuntu:20.04
RUN apt-get update && \
apt-get install -y ansible wget unzip git && \
wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip -O /tmp/terraform_0.14.7_linux_amd64.zip && \
unzip /tmp/terraform_0.14.7_linux_amd64.zip -d /usr/bin && \
wget https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz -O /tmp/helm-v3.5.2-linux-amd64.tar.gz && \
tar -zxvf /tmp/helm-v3.5.2-linux-amd64.tar.gz --directory /tmp/ && \
cp /tmp/linux-amd64/helm /usr/bin && \
wget https://github.com/rancher/rke/releases/download/v1.1.15/rke_linux-amd64 -O /usr/bin/rke && \
chmod +x /usr/bin/rke && \
chmod +x /usr/bin/helm
```

```
docker build -t dockerready .
```
 **git**, **Terraform**, **Ansible**, **Helm**, **kubectl** and **rke**

(https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

(https://www.terraform.io/downloads.html)

(https://github.com/rancher/rke/releases)

(https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

(https://helm.sh/docs/intro/install/)

(https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

```
ssh-keygen -f xoa_rsa -t rsa
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; terraform plan
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; terraform apply
```

```
docker run --rm -e XOA_HOST="192.168.1.1" -e XOA_USER="invent" -e XOA_PASS="*****" luizhpriotto/xenorchestra_inventory > invent.ini
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -u usr_amcom --private-key xoa_rsa -i invent.ini playground.yml
```

```
sed -e "s/\${master}/10.50.1.x/" -e "s/\${worker1}/10.50.1.x/" -e "s/\${worker2}/10.50.1.x/" template.yml > cluster.yml
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; rke up
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; kubectl get nodes -o wide
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; helm repo add rancher-latest https://releases.rancher.com/server-charts/latest; kubectl create namespace cattle-system
```
```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml; kubectl create namespace cert-manager; helm repo add jetstack https://charts.jetstack.io; helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.4
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; kubectl get pods --namespace cert-manager
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.domain.local
```

```
docker run --rm -v $(pwd):/tmp/cookbook dockerready /bin/sh -c 'cd /tmp/cookbook'; export KUBECONFIG=kube_config_cluster.yml; kubectl -n cattle-system get deploy rancher
```