build:
	docker build --force-rm=true -t jnishii/nongpu-ple-gym .

run:
	docker run -it --rm jnishii/nongpu-ple-gym
#	docker run -it --rm -e XMODIFIERS -v /tmp/.X11-unix:/tmp/.X11-unix \
#		-v `pwd`:/home/pochi/ jnishii/nongpu-ple-gym

ps:
	docker ps -a

clean:
	rm *~
