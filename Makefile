DOCKER_IMAGE=dsuite/alpine-runit
DIR:=$(strip $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST)))))


build: build-3.7 build-3.8 build-3.9

test: test-3.7 test-3.8 test-3.9

push: push-3.7 push-3.8 push-3.9

build-3.7:
	@docker build \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--file $(DIR)/Dockerfiles/Dockerfile-3.7 \
		--tag $(DOCKER_IMAGE):3.7 \
		$(DIR)/Dockerfiles

build-3.8:
	@docker build \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--file $(DIR)/Dockerfiles/Dockerfile-3.8 \
		--tag $(DOCKER_IMAGE):3.8 \
		$(DIR)/Dockerfiles

build-3.9:
	@docker build \
		--build-arg http_proxy=${http_proxy} \
		--build-arg https_proxy=${https_proxy} \
		--file $(DIR)/Dockerfiles/Dockerfile-3.9 \
		--tag $(DOCKER_IMAGE):3.9 \
		$(DIR)/Dockerfiles
	docker tag $(DOCKER_IMAGE):3.9 $(DOCKER_IMAGE):latest


test-3.7: build-3.7
	@docker run --rm -t \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-v $(DIR)/tests:/goss \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		dsuite/goss:latest \
		dgoss run --entrypoint=/goss/entrypoint.sh $(DOCKER_IMAGE):3.7

test-3.8: build-3.8
	@docker run --rm -t \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-v $(DIR)/tests:/goss \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		dsuite/goss:latest \
		dgoss run --entrypoint=/goss/entrypoint.sh $(DOCKER_IMAGE):3.8

test-3.9: build-3.9
	@docker run --rm -t \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-v $(DIR)/tests:/goss \
		-v /tmp:/tmp \
		-v /var/run/docker.sock:/var/run/docker.sock \
		dsuite/goss:latest \
		dgoss run --entrypoint=/goss/entrypoint.sh $(DOCKER_IMAGE):3.9

push-3.7: build-3.7
	@docker push $(DOCKER_IMAGE):3.7

push-3.8: build-3.8
	@docker push $(DOCKER_IMAGE):3.8

push-3.9: build-3.9
	@docker push $(DOCKER_IMAGE):3.9
	@docker push $(DOCKER_IMAGE):latest

shell-3.7: build-3.7
	@docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):3.7 \
		bash

shell-3.8: build-3.8
	@docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):3.8 \
		bash

shell-3.9: build-3.9
	@docker run -it --rm \
		-e http_proxy=${http_proxy} \
		-e https_proxy=${https_proxy} \
		-e DEBUG_LEVEL=DEBUG \
		$(DOCKER_IMAGE):3.9 \
		bash

remove:
	@docker images | grep $(DOCKER_IMAGE) | tr -s ' ' | cut -d ' ' -f 2 | xargs -I {} docker rmi $(DOCKER_IMAGE):{}

