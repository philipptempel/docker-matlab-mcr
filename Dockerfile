FROM ubuntu:xenial

MAINTAINER Philipp Tempel <mail@philipptempel.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qy \
  && apt-get upgrade -qy \
  && apt-get dist-upgrade -qy \
  && apt-get install -qy apt-utils

RUN apt-get install -yq \
  xorg \
  unzip \
  wget

ADD install.txt /tmp/mcr/install.txt

RUN cd /tmp/mcr/ && \
  wget http://ssd.mathworks.com/supportfiles/downloads/R2019b/Release/3/deployment_files/installer/complete/glnxa64/MATLAB_Runtime_R2019b_Update_3_glnxa64.zip && \
  unzip MATLAB_Runtime_R2019b_Update_3_glnxa64.zip && \
  ./install -inputFile /tmp/mcr/install.txt

ENV LD_LIBRARY_PATH /usr/sbin/mcr/v97/runtime/glnxa64:/usr/sbin/mcr/v97/bin/glnxa64:/usr/sbin/mcr/v97/sys/os/glnxa64:/usr/sbin/mcr/v97/extern/bin/glnxa64

