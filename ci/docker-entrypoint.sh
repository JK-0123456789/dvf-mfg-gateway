#!/bin/bash
if [[ -n ${ECS_CONTAINER_METADATA_URI_V4} ]]; then
  echo "ECS_CONTAINER_METADATA_URI_V4: ${ECS_CONTAINER_METADATA_URI_V4}"
  export ECS_INSTANCE_IP_ADDRESS=$(/usr/bin/curl --retry 5 --connect-timeout 3 -s "${ECS_CONTAINER_METADATA_URI_V4}" | /usr/bin/jq .Networks[0].IPv4Addresses[0] -r)
  echo "setting ip address: ${ECS_INSTANCE_IP_ADDRESS}"
fi
java org.springframework.boot.loader.JarLauncher