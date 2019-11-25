#!/bin/bash

DKNAME=jupyter
DKUSER=jovyan
DKHOME=/home/${DKUSER}
PWD=`pwd`
WD="${PWD}"
IMAGE=jnishii/docker-gym-nongpu36

DKOPT="--rm \
	-h ${DKNAME} \
	--name ${DKNAME} \
	-v "${WD}":/${DKHOME} \
	-p 8888:8888"

# docker run: 
# --hostname , -h : Container host name
# --detach, -d : Run container in background and print container ID
# -it  :  Allocate pseudo-TTY;  creating an interactive bash shell
# --name : Assign name
# --rm : Automatically remove the container when it exits
#
# https://docs.docker.com/engine/reference/commandline/run/#examples

Usage(){
	echo "docker-run.sh [option]"
	echo "  -h    : show this usage"
	echo "  -X    : start bash terminal and X server"
	echo "  -bg   : start jupyter notebook in background mode"
	echo "  -fg (default) : start jupyter notebook in foreground mode"
}

runX(){
	IP=`ipconfig getifaddr en0`

	echo "running X server and bash ..."
	echo "You can start jupyter by typing jupyter.sh"
	echo ""
	echo "If you want to connet X server on Docker, run X client on your system."
	echo "  On Mac, follow the instruction below before running this script."
	echo "  1. Start XQuartz and run socat on the terminal of XQuartz."
	echo "  2. $ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"${DISPLAY}\""
	echo "  3. open another terminal of XQuartz and run this script."
	
	xhost ${IP}

	docker run -it \
		${DKOPT} \
		-e XMODIFIERS \
		-e DISPLAY=${IP}:0 \
		-v /tmp/.X11-unix:/tmp/.X11-unix:rw --privileged \
		${IMAGE} /bin/bash

	xhost -
}

runJupyterBG(){
	echo "running docker in background mode..."
	echo 
	echo "$ docker logs ${DKNAME}  # confirm docker token"
	echo "$ docker stop ${DKNAME}  # stop docker" 
	echo "$ docker start ${DKNAME} # start docker" 

	docker run -d ${DKOPT} ${IMAGE}
}

runJupyterFG(){
	docker run -it ${DKOPT} ${IMAGE}
}

case ${1} in
	-h)  Usage ;;
    -X)  runX ;;
    -bg) runJupyterBG ;;
    *) runJupyterFG ;;
esac
