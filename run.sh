#!/bin/bash

IP=`ipconfig getifaddr en0`

xhost + ${IP}

[ ! -d pochi ] && mkdir pochi
PWD=`pwd`
WD=${PWD}/pochi

docker run -it --rm \
		-e XMODIFIERS \
		-e DISPLAY=${IP}:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v ${WD}:/home/ \
		jnishii/ubuntu-nongpu-gym

#	docker run -it --rm -e XMODIFIERS -v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v `pwd`/pochi:/home/pochi/ bcl-group/ubuntu-anaconda3-opencv3

xhost - ${IP}
