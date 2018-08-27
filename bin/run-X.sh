#!/bin/bash

IP=`ipconfig getifaddr en0`
IMAGE=jnishii/docker-gym-ple-nongpu
USER=jovyan

xhost +

[ ! -d ${USER} ] && mkdir ${USER}
PWD=`pwd`
WD=${PWD}/${USER}

docker run -it --rm \
		-e XMODIFIERS \
		-e DISPLAY=${IP}:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ${WD}:/home/ \
		${IMAGE}

#	docker run -it --rm -e XMODIFIERS -v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v `pwd`/pochi:/home/pochi/ jnishii/nongpu-ple-gym

xhost - ${IP}
