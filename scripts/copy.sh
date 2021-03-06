#!/usr/bin/env sh

set -xeu

cp -r deploy-repo/. builddir/
cp jq-github-release/jq-linux64 builddir/jq
fly_version=$(cat concourse-github-release/tag)
fly_download_url="https://github.com/concourse/concourse/releases/download/"
wget ${fly_download_url}/${fly_version}/fly_linux_amd64 -O concourse-github-release/fly_linux_amd64
cp concourse-github-release/fly_linux_amd64 builddir/fly
cp cf-cli-s3-release/cf builddir/cf
ls -al
ls -al spruce-github-release
cp spruce-github-release/spruce-linux-amd64 builddir/spruce
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