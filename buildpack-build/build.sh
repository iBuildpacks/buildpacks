#!/usr/bin/env bash

set -eo pipefail

PACKAGE_PREFIX=/go/src/github.com/buildpacks

BUILDENV=golang:alpine-dev

LIFECYCLE_VERSION=0.5.0
PACK_VERSION=v0.6.0

if [ -d out ]; then
  rm -rf out
fi

docker build -t ${BUILDENV} .

docker run --rm -it -v $PWD:${PACKAGE_PREFIX} ${BUILDENV} \
  bash -c "cd pack && git reset HEAD --hard && git clean -df && git checkout ${PACK_VERSION} && \
  git apply ../${PACK_VERSION}.patch && \
  env GO111MODULE=off make build && cd .. && \
  cd lifecycle && git reset HEAD --hard && git clean -df && git checkout v${LIFECYCLE_VERSION} && \
  env LIFECYCLE_VERSION=${LIFECYCLE_VERSION} make build package"

mkdir out

cp lifecycle/out/lifecycle-* out
cp pack/out/pack out
rm -rf lifecycle/out pack/out
