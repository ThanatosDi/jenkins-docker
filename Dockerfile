FROM jenkins/jenkins:latest
LABEL owner="ThanatosDi" version="1.0" description="test docker file."

EXPOSE 8080 50000

VOLUME /var/jenkins_home

USER root
# install sudo and add jenkins user to sudoers.
RUN apt-get update && apt-get install -y sudo
RUN echo "jenkins ALL=NOPASSWD:ALL" >> /etc/sudoers

# set timezone
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# install docker engine and docker-compose.
RUN sudo apt-get update && sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

RUN sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

RUN sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose && \
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

RUN /etc/init.d/docker start