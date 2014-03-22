FROM ubuntu:12.04

MAINTAINER Thomas Gruner, tom.gruner@gmail.com

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    vim \
    nano \
    curl \
    wget \
    build-essential \
    git \
    python \
    python-dev \
    python-setuptools \
    python-software-properties \
    supervisor


RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales

ENV LC_ALL en_US.UTF-8

RUN easy_install pip
# stack overflow solution to error: 
# http://stackoverflow.com/questions/20905350/latest-pip-fails-with-requires-setuptools-0-8-for-dist-info
RUN pip install setuptools --no-use-wheel --upgrade

#Make the /home/docker directories available for other builds
RUN mkdir -p /home && mkdir -p /home/docker