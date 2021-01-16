DOCKER_IMAGE=dsuite/alpine-runit:example

DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))

build:
	@docker build \
		--file Dockerfile \
		--tag $(DOCKER_IMAGE) \
		.

shell:
	@docker run -it --rm \
		-e DEBUG_LEVEL=DEBUG \
		--name=runit-example \
		$(DOCKER_IMAGE) \
		bash
