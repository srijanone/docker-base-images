#!/usr/bin/make -f

REGISTRY=srijanlabs/debian
DEBIAN_VERSION=10

build:
	docker build --build-arg DEBIAN_VERSION=${DEBIAN_VERSION}-slim -t $(REGISTRY):${DEBIAN_VERSION} .

push:
	docker push $(REGISTRY):${DEBIAN_VERSION}

.PHONY: *
