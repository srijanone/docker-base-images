#!/usr/bin/make -f

REGISTRY=srijanlabs/nginx
BASE_VERSION=buster

build:
	docker build --build-arg BASE_VERSION=${BASE_VERSION} -t $(REGISTRY):${BASE_VERSION} .

push:
	docker push $(REGISTRY):${BASE_VERSION}
run:
	docker run --rm -it -p 80:80 srijanlabs/nginx:${BASE_VERSION}

.PHONY: *
