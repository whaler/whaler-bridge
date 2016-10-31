#!/bin/sh

if [ ! -z "$1" ]; then
    DOCKER_VERSION="$1"
fi

set -e

: ${DOCKER_BUCKET:=get.docker.com}; export DOCKER_BUCKET
: ${DOCKER_VERSION:=latest}; export DOCKER_VERSION

rm -rf /.whaler/bin
mkdir -p /.whaler/bin

echo ""
echo "Installing Docker ..."
echo ""

curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz
tar -xzf docker.tgz
mv docker/* /.whaler/bin/
rmdir docker
rm docker.tgz
export PATH=${PATH}:/.whaler/bin

echo ""
docker version

echo ""
echo "Installing Whaler ..."
echo ""

curl -fSL https://github.com/whaler/whaler-client/releases/download/linux_amd64/whaler -o /.whaler/bin/whaler
chmod 0755 /.whaler/bin/whaler
export PATH=${PATH}:/.whaler/bin

export WHALER_FRONTEND=noninteractive
WHALER_VERSION=$(whaler -V)

echo ""
echo "Version:  $WHALER_VERSION"
echo ""
