#!/usr/bin/env sh

set -xeu

cp -r deploy-repo/. builddir/
cp jq-github-release/jq-linux64 builddir/jq
cp concourse-github-release/fly_linux_amd64 builddir/fly
cp cf-cli-s3-release/cf builddir/cf
cp bosh-s3-release/bosh-cli-*-linux-amd64 builddir/bosh
cp yaml-github-release/yq_linux_amd64 builddir/yaml
cp certstrap-github-release/certstrap-v*-linux-amd64 builddir/certstrap
cp golang-s3-release/go*.linux-amd64.tar.gz builddir/go.tar.gz
cp aws-cli-s3-release/awscli-bundle.zip builddir/awscli-bundle.zip
unzip terraform-release/terraform_*_linux_amd64.zip
cp terraform builddir/terraform
unzip vault-release/vault_*_linux_amd64.zip
cp vault builddir/vault
unzip consul-release/consul_*_linux_amd64.zip
cp consul builddir/consul