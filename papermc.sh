#!/bin/bash


usage() {
echo "Usage: $0 [project] [version]"
exit 1
}

if [[ ! -n "$1" ]]; then
echo "No Project Given.";
usage
fi

if [[ ! -n "$2" ]]; then
echo "no version given"
usage
fi

PROJECT=$1
VERSION=$2

sudo apt install -y curl jq

LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${VERSION}/builds | \
  jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]')

sudo apt remove curl jq
if [ "$LATEST_BUILD" != "null" ]; then
  JAR_NAME=${PROJECT}-${VERSION}-${LATEST_BUILD}.jar
  PAPERMC_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${VERSION}/builds/${LATEST_BUILD}/downloads/${JAR_NAME}"

  # Download the latest Paper version
  wget $PAPERMC_URL
  echo "Download completed"
else
  echo "No stable build for version $VERSION found :("
  exit 1
fi
