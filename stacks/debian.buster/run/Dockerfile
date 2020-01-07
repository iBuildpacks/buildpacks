FROM debian:buster

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
  sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

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
  # scm tools
  git \
  # languages
  php && \
  rm -rf /var/lib/apt/lists/*

# ADD https://getcomposer.org/download/1.9.1/composer.phar /usr/bin/composer

# RUN chmod +x /usr/bin/composer && \
#   composer config -g repo.packagist composer https://packagist.phpcomposer.com

# set locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
  echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

# set timezone
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ARG cnb_uid=1000
ARG cnb_gid=1000

RUN groupadd cnb --gid ${cnb_gid} && \
  useradd --uid ${cnb_uid} --gid ${cnb_gid} -m -s /bin/bash cnb

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

USER cnb

ARG stack_id
LABEL io.buildpacks.stack.id=${stack_id}
