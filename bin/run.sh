#!/bin/bash

DKNAME=notebook
DKUSER=jovyan
DKHOME=/home/${DKUSER}
PWD=`pwd`
WD="${PWD}"
IMAGE=jnishii/docker-gym-ple-nongpu

runJupyterBG(){
	echo "running docker background mode..."
	echo 
	echo "$ docker logs ${DKNAME}  # confirm docker token"
	echo "$ docker stop ${DKNAME}  # stop docker" 
	echo "$ docker start ${DKNAME} # start docker" 
	docker run -d --name ${DKNAME} \
		-v ${WD}:/${DKHOME}/ -p 8888:8888 ${IMAGE}
}

runJupyterFG(){
	docker run -it --rm \
		-v "${WD}":/${DKHOME}/ -p 8888:8888 ${IMAGE}
}

[ ! -d ${WD} ] && mkdir ${WD}
echo "URL of jupyter notebook is"
echo "    http://localhost:8888/"


runJupyterFG