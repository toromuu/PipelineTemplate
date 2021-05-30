FROM jenkins/jenkins

ARG HOST_UID=1004
ARG HOST_GID=999

USER root

#AVOID INITIAL CONFIGURATION
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV JENKINS_HOME /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY ./jenkins_as_code/jobs /var/jenkins_home/


#INSTALL DJANGO

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY requirements.txt ./
RUN pip3 install Django psycopg2-binary Pillow requests


#INSTALL ANSIBLE
RUN apt-get -y update && apt-get install python3-pip -y && \
    pip3 install ansible --upgrade

RUN mkdir /ansible && \
    mkdir -p /etc/ansible



#INSTALL TERRAFORM

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip

# Unzip
RUN unzip terraform_0.14.7_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/

# Check that it's installed
RUN terraform --version 




