#!/bin/bash
set -e
PAPER_VERSION="1.21.4"
if [[ -n "$1" ]]; then
PAPER_VERSION=$1
fi

wget https://raw.githubusercontent.com/CoryBorek/mc-server-scripts/refs/heads/main/papermc.sh
chmod +x ./papermc.sh
./papermc.sh "paper" $PAPER_VERSION
rm papermc.sh
echo "eula=true" > eula.txt
