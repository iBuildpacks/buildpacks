#!/usr/bin/env sh

set -eo pipefail

sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

apk update && apk upgrade

apk add bash binutils

wget -O /usr/bin/pack https://tc.tosone.cn/pack
chmod +x /usr/bin/pack

pushd /root
wget https://tc.tosone.cn/caicloud.build.tar.gz
wget https://tc.tosone.cn/caicloud.run.tar.gz
gunzip -c caicloud.build.tar.gz | docker load
gunzip -c caicloud.run.tar.gz | docker load
rm caicloud.build.tar.gz caicloud.run.tar.gz
popd
