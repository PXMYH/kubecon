#!/usr/bin/env bash

sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add 

deb http://apt.kubernetes.io/ kubernetes-xenial main 

apt-get update
apt-get install -y kubelet kubeadm kubectl kubernetes-cni