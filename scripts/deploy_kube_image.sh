#!/usr/bin/env bash

# connect to host
echo "$HOST_PRIVATE_KEY" > host_priv.pem
chmod 400 host_priv.pem

cat << EOF > install_kube.sh
  #!/usr/bin/env bash
  # https://www.techrepublic.com/article/how-to-quickly-install-kubernetes-on-ubuntu/
  # sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add 
  # sudo deb http://apt.kubernetes.io/ kubernetes-xenial main 
  # apt-get update -y
  # apt-get install -y kubelet kubeadm kubectl kubernetes-cni

  curl https://get.k8s.io > kubernetes_install.sh
  chmod +x kubernetes_install.sh
  yes | ./kubernetes_install.sh
EOF

chmod +x install_kube.sh

echo "install_kube.sh content:"
cat install_kube.sh

scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" -i host_priv.pem install_kube.sh ubuntu@$HOST_IP:~
ssh -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" -i host_priv.pem ubuntu@$HOST_IP 'bash -s' < install_kube.sh