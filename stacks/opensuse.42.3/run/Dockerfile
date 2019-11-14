FROM opensuse/leap:42.3

RUN zypper modifyrepo -da && \
  zypper addrepo -f http://mirrors.aliyun.com/opensuse/update/leap/42.3/oss  openSUSE-42.3-Update-Oss && \
  zypper addrepo -f http://mirrors.aliyun.com/opensuse/update/leap/42.3/non-oss/ openSUSE-42.3-Update-Non-Oss && \
  zypper addrepo -f http://mirrors.aliyun.com/opensuse/distribution/leap/42.3/repo/oss/ openSUSE-42.3-Oss && \
  zypper addrepo -f http://mirrors.aliyun.com/opensuse/distribution/leap/42.3/repo/non-oss/  openSUSE-42.3-Non-Oss && \
  zypper addrepo -f http://mirrors.aliyun.com/packman/openSUSE_Leap_42.3/ aliyun-packman && \
  zypper --gpg-auto-import-keys refresh && \
  zypper install -y --type pattern devel_basis && \
  zypper install -y git cmake glibc-locale binutils && \
  zypper clean

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
