FROM centos:7.5.1804

ADD https://mirrors.aliyun.com/repo/Centos-7.repo /etc/yum.repos.d/CentOS-Base.repo
RUN sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo

RUN yum update -y && yum groupinstall -y "Development Tools" && \
  yum install -y epel-release \
  kernel-devel file \
  zip unzip tar xz \
  # download tools
  ca-certificates wget curl \
  # gyp need python support
  python3 python3-pip python3-setuptools python3-dev

# set locales
RUN localedef -i en_US -f UTF-8 en_US.UTF-8 && \
  localedef -i en_US -f UTF-8 zh_CN.UTF-8

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
