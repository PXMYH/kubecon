#!/usr/bin/env sh
set -euox pipefail

echo "deploying Vault ... [SIMULATION]"

echo "Spinning up Vault and Consul containers"

current_dir=$(pwd)
cp ../../docker-compose.yml $current_dir
docker-compose -f $current_dir/docker-compose.yml up -d cault vault

