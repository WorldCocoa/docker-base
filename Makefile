
DOCKER_BASE_TAG_NAME ?= xela7/cocoamap-base

#Get the current directory of this Makefile as it may be included in other Makefiles
#http://stackoverflow.com/questions/18136918/how-to-get-current-directory-of-your-makefile
DOCKER_BASE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOCKER_BASE_DIR := $(abspath $(patsubst %/,%,$(dir $(DOCKER_BASE_PATH))))


#All names should be prefixed with 'base'
base-build:

	cd ${DOCKER_BASE_DIR} && docker build -t ${DOCKER_BASE_TAG_NAME} .