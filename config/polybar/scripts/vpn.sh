#!/bin/bash

get_ip () {
  ifconfig tun0 2>/dev/null | \
    grep inet | \
    head -n 1 | \
    awk '{print $2}'
}

ip=$(get_ip)

if [[ $ip == "" ]]; then
  >&2 echo "Not connected"
  exit 1
elif [[ $1 == "get-ip" ]]; then
  echo "$ip"
else
  echo " "
fi
