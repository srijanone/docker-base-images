#!/usr/bin/make -f

REGISTRY=srijanlabs/debian
DEBIAN_VERSION=buster

build:
	docker build --build-arg DEBIAN_VERSION=${DEBIAN_VERSION}-slim -t $(REGISTRY):${DEBIAN_VERSION} .

push:
	docker push $(REGISTRY):${DEBIAN_VERSION}

.PHONY: *
