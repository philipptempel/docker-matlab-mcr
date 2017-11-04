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
  wget --no-verbose http://ssd.mathworks.com/supportfiles/downloads/R2017b/deployment_files/R2017b/installers/glnxa64/MCR_R2017b_glnxa64_installer.zip && \
  unzip MCR_R2017b_glnxa64_installer.zip && \
  ./install -inputFile install.txt

ENV LD_LIBRARY_PATH /usr/sbin/mcr/v92/runtime/glnxa64:/usr/sbin/mcr/v92/bin/glnxa64:/usr/sbin/mcr/v92/sys/os/glnxa64

