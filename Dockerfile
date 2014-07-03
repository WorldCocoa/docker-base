FROM ubuntu:14.04

MAINTAINER Alex Tokar "alext@bitbamboo.com"

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

RUN easy_install pip
# stack overflow solution to error: 
# http://stackoverflow.com/questions/20905350/latest-pip-fails-with-requires-setuptools-0-8-for-dist-info
RUN pip install setuptools --no-use-wheel --upgrade
