IMAGE=jnishii/docker-gym-nongpu
VERSION=$(shell cat VERSION)

release: 
	echo "$VERSION"
	git add .
	git commit -m "version ${VERSION}"
	git tag -a "${VERSION}" -m "version ${VERSION}"
	git push
	git push --tags
#	docker tag ${IMAGE}:latest ${IMAGE}:${VERSION}
#	docker push ${IMAGE}:latest
#	docker push ${IMAGE}:$version

build:
	docker build --force-rm=true -t ${IMAGE}:latest .

run:
	bin/run.sh

save:
	docker save jnishii/docker-gym-nongpu -o gymbox.tar

load:
	docker load -i gymbox.tar

ps:
	docker ps -a

clean:
	rm *~
