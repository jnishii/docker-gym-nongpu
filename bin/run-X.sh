#!/bin/bash

IP=`ipconfig getifaddr en0`
IMAGE=jnishii/docker-gym-ple-nongpu
DKUSER=jovyan
PWD=`pwd`
WD=${PWD}/${USER}

xhost + ${IP}


docker run -it --rm \
		-e XMODIFIERS \
		-e DISPLAY=${IP}:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ${WD}:/home/ \
		${IMAGE}

xhost -
