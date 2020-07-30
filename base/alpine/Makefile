#!/usr/bin/make -f

REGISTRY=srijanlabs/alpine
ALPINE_VERSION=3.9

build:
	docker build --build-arg ALPINE_VERSION=${ALPINE_VERSION} -t $(REGISTRY):${ALPINE_VERSION} .

push:
	docker push $(REGISTRY):${ALPINE_VERSION}

.PHONY: *
