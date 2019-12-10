#!/usr/bin/env bash

set -eo pipefail

# stacks suit for all of the buildpacks

PREFIX=caicloud
ID_PREFIX=io.caicloud.stacks

docker-build() {
  pushd $1/$2
  docker build --build-arg "stack_id=${ID_PREFIX}.$1" -t ${PREFIX}-$2:$1 . >/dev/null 2>&1
  popd
}

for dir in `find . -type d -d 1`; do
  docker-build $(basename "${dir}") build
  docker-build $(basename "${dir}") run
done
