FROM ubuntu:xenial

MAINTAINER Philipp Tempel <mail@philipptempel.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qy \
  && apt-get upgrade -qy \
  && apt-get dist-upgrade -qy

RUN apt-get install -yq \
  xorg \
  unzip \
  wget

ADD install.txt /tmp/mcr/install.txt

RUN cd /tmp/mcr/ && \
  wget --no-verbose http://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/glnxa64/MCR_R2018b_glnxa64_installer.zip && \
  unzip MCR_R2018b_glnxa64_installer.zip && \
  ./install -inputFile /tmp/mcr/install.txt

ENV LD_LIBRARY_PATH /usr/sbin/mcr/v95/runtime/glnxa64:/usr/sbin/mcr/v95/bin/glnxa64:/usr/sbin/mcr/v95/sys/os/glnxa64:/usr/sbin/mcr/v95/extern/bin/glnxa64

