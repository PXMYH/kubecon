#!/usr/bin/env sh
set -euox pipefail

echo "deploying Vault ... [SIMULATION]"

echo "Spinning up Vault and Consul containers"

docker-compose