#!/usr/bin/env bash
set -eux

names=( terraform jq bosh yaml certstrap)
for name in "${names[@]}"
do
  chmod +x /usr/bin/$name
  sync # docker bug requires this
  $name --version
done