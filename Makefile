IMAGE=jnishii/docker-gym-ple-nongpu

build:
	docker build --force-rm=true -t ${IMAGE} .

run:
	docker run -it --rm ${IMAGE}
#	docker run -it --rm -e XMODIFIERS -v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v `pwd`:/home/pochi/ jnishii/nongpu-ple-gym

ps:
	docker ps -a

clean:
	rm *~
