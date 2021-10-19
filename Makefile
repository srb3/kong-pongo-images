.PHONY: all build tag push
SHELL := /usr/bin/env bash

PONGO_BUILD_CMD=pongo build --no-cassandra --no-postgres
DOCKER_TAG_CMD=docker tag kong-pongo-test:$(KONG_VERSION) $(DOCKER_REPO)/kong-pongo-test:$(KONG_VERSION)
DOCKER_PUSH_CMD=docker push $(DOCKER_REPO)/kong-pongo-test:$(KONG_VERSION)
all: build tag push

build:
	@echo "build $(KONG_VERSION) $(DOCKER_REPO)"; \
	$(PONGO_BUILD_CMD)

tag:
	@echo "tagging image"; \
	$(DOCKER_TAG_CMD)

push:
	@echo "push $(DOCKER_REPO)/kong-pongo-test:$(KONG_VERSION)"; \
	$(DOCKER_PUSH_CMD)

