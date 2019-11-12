#!/usr/bin/env bash

set -eo pipefail

# stacks suit for all of the buildpacks

PREFIX=caicloud
ID_PREFIX=io.caicloud.stacks
IMAGE=bionic

docker-build() {
  pushd $1
  docker build --build-arg "stack_id=${ID_PREFIX}.${IMAGE}" -t ${PREFIX}-$1:bionic .
  popd
}

docker-build build
docker-build run
