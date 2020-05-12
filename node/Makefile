#!/usr/bin/make -f

REGISTRY=srijanlabs/node
BASE_TAG=1.x

define build_image
	# Building production images.
	docker build --no-cache --build-arg BASE_TAG=${BASE_TAG} --build-arg NODE_VERSION=${1} -t $(REGISTRY):${1}-${BASE_TAG} base

	# Building dev images.
	docker build --no-cache --build-arg BASE_TAG=${BASE_TAG} --build-arg NODE_VERSION=${1} -t $(REGISTRY):${1}-${BASE_TAG}-dev dev

endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-${BASE_TAG}

	# Pushing dev images.
	docker push $(REGISTRY):${1}-${BASE_TAG}-dev

endef

build:
	$(call build_image,10.19.0)
	$(call build_image,12.16.0)
push:
	$(call push_image,10.19.0)
	$(call push_image,12.16.0)

.PHONY: *
