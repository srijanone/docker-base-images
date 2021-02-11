#!/usr/bin/make -f

REGISTRY=srijanlabs/node
BASE_VERSION=buster

define build_image
	# Building production images.
	docker build --build-arg BASE_VERSION=${BASE_VERSION} --build-arg NODE_VERSION=${1} -t $(REGISTRY):${2}-${BASE_VERSION} -f base/Dockerfile .

	# Building dev images.
	docker build --build-arg BASE_VERSION=${BASE_VERSION} --build-arg NODE_VERSION=${1} -t $(REGISTRY):${2}-${BASE_VERSION}-dev -f dev/Dockerfile .

endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-${BASE_VERSION}

	# Pushing dev images.
	docker push $(REGISTRY):${1}-${BASE_VERSION}-dev

endef

build:
	$(call build_image,10.23.2,10)
	$(call build_image,12.20.1,12)
	$(call build_image,14.15.5,14)
push:
	$(call push_image,10)
	$(call push_image,12)
	$(call push_image,14)

.PHONY: *
