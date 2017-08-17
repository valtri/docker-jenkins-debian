FROM debian:8
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

COPY webupd8team-ppa-trusty.list /etc/apt/sources.list.d/

# launch repository update without the key first (workaround for bugs in apt)
RUN apt-get update \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x7B2C3B0889BF5709A105D03AC2518248EEA14886 \
 && apt-get update \
 && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && apt-get install -y --no-install-recommends ca-certificates git oracle-java8-installer openssh-server sudo \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd \
 && useradd -m -d /home/jenkins -s /bin/bash jenkins \
 && sed -i '/root\tALL=/a jenkins ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

EXPOSE 22

COPY docker-entry.sh /
CMD ["/docker-entry.sh", "/usr/sbin/sshd", "-D"]
