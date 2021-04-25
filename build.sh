#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

IMAGE_TAG="2021-04-17_01"
UPSTREAM_TAG="latest"
UPSTREAM_TAG2="project"

docker build \
    --pull \
    -t ssmbtech/cloud-toolbox:$IMAGE_TAG \
    .

#push
docker login
docker push ssmbtech/cloud-toolbox:$IMAGE_TAG

docker tag ssmbtech/cloud-toolbox:$IMAGE_TAG ssmbtech/cloud-toolbox:$UPSTREAM_TAG
docker push ssmbtech/cloud-toolbox:$UPSTREAM_TAG

docker tag ssmbtech/cloud-toolbox:$IMAGE_TAG ssmbtech/cloud-toolbox:$UPSTREAM_TAG2
docker push ssmbtech/cloud-toolbox:$UPSTREAM_TAG2
