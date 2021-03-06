# Info

Basic Jenkins node Debian image

Installed:

* Java 8 JRE headless
* openssh server
* sudo

# Usage

In Jenkins:

* for example with *Docker Plugin*
* start command must be set to */docker-entry.sh /usr/sbin/sshd -D*

## Simple way

Initial password is created during start, but only if */context/.ssh* directory is not found locally:

* user: **jenkins**
* password: **jenkins**

Steps:

    docker pull valtri/docker-jenkins-debian
    docker run -itd --name jenkins-debian valtri/docker-jenkins-debian

## Recommended way

Access using ssh keys and no password will be created.

Steps:

	ssh-keygen -t rsa -f jenkins_node
	mkdir -p context/.ssh
	#SELinux: chcon -Rt svirt_sandbox_file_t context/
	cp -p jenkins_node.pub context/.ssh/authorized_keys

    docker pull valtri/docker-jenkins-debian
    docker run -itd --name jenkins-debian --volume `pwd`/context:/context:ro valtri/docker-jenkins-debian

# Tags

* **9**, **latest**: Debian 9 (stretch)
* **8**: Debian 8 (jessie)
