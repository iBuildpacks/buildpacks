FROM golang:alpine

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
  apk update && apk upgrade && \
  apk add make git tar bash

VOLUME /go/src/github.com/iBuildpacks

CMD bash
