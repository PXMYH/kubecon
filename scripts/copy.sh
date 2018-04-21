#!/usr/bin/env sh

set -xeu

cp -r deploy-repo/. builddir/
cp jq-github-release/jq-linux64 builddir/jq
ls concourse-github-release
wget https://github.com/concourse/concourse/releases/download/v3.11.0/fly_linux_amd64 -O concourse-github-release/fly_linux_amd64
cp concourse-github-release/fly_linux_amd64 builddir/fly
cp cf-cli-s3-release/cf builddir/cf
cp bosh-s3-release/bosh-cli-*-linux-amd64 builddir/bosh
cp yaml-github-release/yq_linux_amd64 builddir/yaml
cp certstrap-github-release/certstrap-v*-linux-amd64 builddir/certstrap
cp aws-cli-s3-release/awscli-bundle.zip builddir/awscli-bundle.zip
unzip terraform-release/terraform_*_linux_amd64.zip
cp terraform builddir/terraform
unzip vault-release/vault_*_linux_amd64.zip
cp vault builddir/vault
unzip consul-release/consul_*_linux_amd64.zip
cp consul builddir/consul