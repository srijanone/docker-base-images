#!/usr/bin/make -f

REGISTRY=srijanlabs/apache
BASE_VERSION=buster

build:
	docker build --build-arg BASE_VERSION=${BASE_VERSION} -t $(REGISTRY):${BASE_VERSION} .

push:
	docker push $(REGISTRY):${BASE_VERSION}

.PHONY: *
