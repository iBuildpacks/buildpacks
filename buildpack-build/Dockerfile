FROM golang:alpine

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache make tar bash git

VOLUME /go/src/github.com/buildpacks

WORKDIR /go/src/github.com/buildpacks

CMD bash
