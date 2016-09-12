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
curl -fSL "https://${DOCKER_BUCKET}/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz
tar -xzf docker.tgz
mv docker/* /.whaler/bin/
rmdir docker
rm docker.tgz

echo ""
/.whaler/bin/docker version
echo ""
