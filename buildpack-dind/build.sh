#!/usr/bin/env bash

set -eo pipefail

PACKAGE_PREFIX=/go/src/github.com/iBuildpacks

BUILDENV=golang:alpine-dev

if [ -d out ]; then
  rm -rf out
fi

docker build -t ${BUILDENV} .

docker run --rm -it -v $PWD:${PACKAGE_PREFIX} ${BUILDENV} \
  bash -c "cd /go/src/github.com/iBuildpacks/pack && make build && \
           ls -alh ./out && cd /go/src/github.com/iBuildpacks/lifecycle && \
           make build package && ls -alh ./out"

mkdir out

cp lifecycle/out/lifecycle-* out
cp pack/out/pack out
rm -rf lifecycle/out pack/out
