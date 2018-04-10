#!/usr/bin/env bash

set -euox pipefail

docker_exist=$(docker -v | echo $?)
docker_compose_exist=$(docker-compose -v | echo $?)

[ docker_exist -eq "0" ] && echo "Docker is not installed"
[ docker_compose_exist -eq "0" ] && echo "Docker compose is not installed"