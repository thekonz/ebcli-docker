#!/bin/bash
set -e
set -o pipefail

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t tempname .

VERSION=$(docker run tempname --version | egrep -o '([0-9]+\.?){3}' | head -1)
echo "Built version $VERSION"
docker tag tempname thekonz/ebcli:$VERSION
docker tag tempname thekonz/ebcli:latest

docker push thekonz/ebcli
