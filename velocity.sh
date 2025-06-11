#!/bin/bash
VELOCITY_VERSION="3.4.0-SNAPSHOT"
if [[ -n "$1" ]]; then
VELOCITY_VERSION=$1
fi

wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/papermc.sh
chmod +x ./papermc.sh
./papermc.sh "velocity" $VELOCITY_VERSION
rm papermc.sh
