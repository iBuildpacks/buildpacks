FROM debian:buster

RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
  sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
  # system utils
  jq tzdata vim netbase gnupg dirmngr tree file locales \
  # download tools
  ca-certificates wget curl \
  # uncompress tools
  tar xz-utils zip unzip \
  # bash completion tool
  bash-completion \
  # sometime need gcc libc-dev support
  build-essential cmake \
  # gyp need python support
  python3 python3-pip python3-setuptools python3-dev \
  # pack need docker support
  docker.io && \
  rm -rf /var/lib/apt/lists/*

RUN /etc/init.d/docker start

# set locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
  echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

# set timezone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf

# ENV DOCKER_CHANNEL stable
# ENV DOCKER_VERSION 19.03.5

# RUN if ! wget -O docker.tgz "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz"; then \
#   echo >&2 "error: failed to download 'docker-${DOCKER_VERSION}' from '${DOCKER_CHANNEL}' for 'x86_64'"; \
#   exit 1; \
#   fi; \
#   tar --extract \
#   --file docker.tgz \
#   --strip-components 1 \
#   --directory /usr/local/bin/; \
#   rm docker.tgz; \
#   dockerd --version; \
#   docker --version

# COPY modprobe.sh /usr/local/bin/modprobe
# COPY docker-entrypoint.sh /usr/local/bin/

# ENV DOCKER_TLS_CERTDIR=/certs
# RUN mkdir /certs /certs/client && chmod 1777 /certs /certs/client

ARG cnb_uid=1000
ARG cnb_gid=1000

RUN groupadd cnb --gid ${cnb_gid} && \
  useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

USER cnb

ARG stack_id
LABEL io.buildpacks.stack.id=${stack_id}
