IMAGE=jnishii/docker-gym-ple-nongpu

build:
	docker build --force-rm=true -t ${IMAGE} .

run:
	bin/run.sh

ps:
	docker ps -a

clean:
	rm *~
