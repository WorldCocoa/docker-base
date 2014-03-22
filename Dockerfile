from ubuntu:precise

MAINTAINER Thomas Gruner "tom.gruner@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	vim \
	nano \
	curl \
	wget \
    locales \
	build-essential \
	git \
	python \
	python-dev \
	python-pip \
	python-setuptools \
	python-software-properties \
	supervisor


RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

#install common utilities
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y 


# stack overflow solution to error: 
# http://stackoverflow.com/questions/20905350/latest-pip-fails-with-requires-setuptools-0-8-for-dist-info
RUN pip install setuptools --no-use-wheel --upgrade

#Make the /home/docker directories available for other builds
RUN mkdir -p /home && mkdir -p /home/docker