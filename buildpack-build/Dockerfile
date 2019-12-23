FROM golang:alpine

WORKDIR /app

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories && \
  apk update && apk upgrade && \
  apk add make git tar bash && \
  mkdir -p /go/src/github.com/buildpack && \
  cd /go/src/github.com/buildpack && \
  git clone https://github.com/buildpack/pack.git && \
  git clone https://github.com/buildpack/lifecycle.git

VOLUME /go/src/github.com/buildpack

CMD bash
