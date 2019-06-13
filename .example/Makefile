DOCKER_IMAGE=dsuite/alpine-runit:example

DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

build:
	docker build \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--file Dockerfile \
		--tag $(DOCKER_IMAGE) \
		.

shell: build
	docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		--name=runit-example \
		$(DOCKER_IMAGE) \
		bash
