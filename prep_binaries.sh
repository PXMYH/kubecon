#!/usr/bin/env sh
set -eux

# use bash
apk update
apk upgrade
apk add bash
bash

names=(terraform fly jq bosh yaml certstrap)
for name in "${names[@]}"
do
  chmod +x /usr/bin/$name
  sync # docker bug requires this
  $name --version
done