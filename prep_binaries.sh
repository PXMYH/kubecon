#!/usr/bin/env bash
set -eux

names=(fly cf jq bosh yaml terraform vault consul yq spruce)
for name in "${names[@]}"
do
  chmod +x /usr/local/bin/$name
  sync # docker bug requires this
  $name --version
done