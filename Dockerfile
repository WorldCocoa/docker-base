FROM ubuntu:14.04

MAINTAINER Alex Tokar "alext@bitbamboo.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update 
RUN apt-get install -y \
    curl \
    wget \
    git \
    libpq-dev \
    python-dev \
    python-setuptools

RUN locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales

ENV LC_ALL en_US.UTF-8

#Use python setup tools to install pip with easy_install
RUN easy_install pip
#Use pip to upgrade python setuptools
# stack overflow solution to error: 
# http://stackoverflow.com/questions/20905350/latest-pip-fails-with-requires-setuptools-0-8-for-dist-info
RUN pip install setuptools --no-use-wheel --upgrade
