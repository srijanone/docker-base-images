#!/usr/bin/make -f

REGISTRY=srijanlabs/node

define build_image
	# Building production images.
	docker build --no-cache --build-arg NODE_VERSION=${1} -t $(REGISTRY):${1}-1.x base

	# Building dev images.
	docker build --no-cache --build-arg NODE_VERSION=${1} --build-arg IMAGE=$(REGISTRY):${1}-1.x -t $(REGISTRY):${1}-1.x-dev dev

endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-1.x

	# Pushing dev images.
	docker push $(REGISTRY)-cli:${1}-1.x-dev

endef

build:
	$(call build_image,10.19.0)
	$(call build_image,12.16.0)
# push:
# 	$(call push_image,10.19.0)
# 	$(call push_image,12.16.0)

.PHONY: *
