# Info

Basic Jenkins node Debian image

Installed:

* Java 8 JRE headless
* openssh server
* sudo

# Usage

In Jenkins:

* for example with *Docker Plugin*

Credentials:

* jenkins/jenkins

Manual launch:

    docker pull valtri/docker-jenkins-debian
    docker run -itd --name jenkins-debian valtri/docker-jenkins-debian

# Tags

* **9**, **latest**: Debian 9 (stretch)
