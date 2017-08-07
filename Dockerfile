FROM debian:9
MAINTAINER František Dvořák <valtri@civ.zcu.cz>

RUN apt-get update \
 && apt-get install -y --no-install-recommends git openjdk-8-jre-headless openssh-server sudo \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd \
 && useradd -m -d /home/jenkins -s /bin/bash jenkins \
 && echo "jenkins:jenkins" | chpasswd \
 && sed -i '/root\tALL=/a jenkins ALL=(ALL) NOPASSWD: ALL' /etc/sudoers

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
