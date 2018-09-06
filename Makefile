IMAGE=jnishii/docker-gym-nongpu

build:
	docker build --force-rm=true -t ${IMAGE} .

run:
	bin/run.sh

ps:
	docker ps -a

clean:
	rm *~
