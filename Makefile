build:
	docker build --force-rm=true -t jnishii/ubuntu-nongpu-gym .

run:
	docker run -it --rm -e XMODIFIERS -v /tmp/.X11-unix:/tmp/.X11-unix \
		-v `pwd`:/home/pochi/ jnishii/ubuntu-nongpu-gym 

ps:
	docker ps -a

clean:
	rm *~
