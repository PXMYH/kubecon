#!/usr/bin/env bash
set -eux

names=(terraform fly jq bosh yaml)
for name in "${names[@]}"
do
  chmod +x /usr/local/bin/$name
  sync # docker bug requires this
  $name --version
done