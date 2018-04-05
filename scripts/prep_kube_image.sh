#!/usr/bin/env bash

# connect to host
echo $HOST_PRIVATE_KEY > host_priv.pem
chmod 400 host_priv.pem

cat << EOF > prep.sh
  sudo apt-get remove -y docker docker-engine docker.io
  sudo apt-get update -y
  sudo apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo apt-key fingerprint 0EBFCD88
  sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

  sudo apt-get update -y
  sudo apt-get install -y docker-ce

  sudo groupadd docker
  sudo usermod -aG docker $USER
  sudo systemctl enable docker
  sudo systemctl disable docker
EOF

echo "prep.sh content:"
cat prep.sh

scp -o "StrictHostKeyChecking no" -o "UserKnownHostsFile /dev/null" -i host_priv.pem prep.sh ubuntu@$HOST_IP:~