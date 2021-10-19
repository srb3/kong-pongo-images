#!/usr/bin/env bash

repo="https://registry.hub.docker.com/v1/repositories/kong/kong-gateway/tags"
declare -a versions=("2.4" "2.5" "2.6")

for i in "${versions[@]}"
do
  echo "$i"
  KONG_VERSION=$(wget -q ${repo} -O -  | sed -e 's/[][]//g' -e 's/"//g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}' |grep $i |grep -v '-'|sort -n | tail -n 1)
  make 
done