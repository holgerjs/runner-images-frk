#!/bin/bash -e

GAI_CONF="/etc/gai.conf"

if [ ! -f "$GAI_CONF" ]; then
  echo "File $GAI_CONF does not exist. Exiting..."
  exit 1
fi

if grep -q "^precedence ::ffff:0:0/96  100" "$GAI_CONF"; then
  echo "IPv4 preference already set in $GAI_CONF"
else
  echo "Setting IPv4 preference in $GAI_CONF"
  sudo echo "precedence ::ffff:0:0/96  100" >> "$GAI_CONF"
fi
