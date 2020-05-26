#!/usr/bin/make -f

REGISTRY=srijanlabs/php

define build_image
	# Building production images.
	docker build --no-cache --build-arg PHP_VERSION=${1} -t $(REGISTRY):${1}-1.x base
	docker build --no-cache --build-arg PHP_VERSION=${1} -t $(REGISTRY)-fpm:${1}-1.x fpm
	docker build --no-cache --build-arg PHP_VERSION=${1} -t $(REGISTRY)-cli:${1}-1.x cli

	# Building dev images.
	docker build --no-cache --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-fpm:${1}-1.x -t $(REGISTRY)-fpm:${1}-1.x-dev dev
	docker build --no-cache --build-arg PHP_VERSION=${1} --build-arg IMAGE=$(REGISTRY)-cli:${1}-1.x -t $(REGISTRY)-cli:${1}-1.x-dev dev

endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-1.x
	docker push $(REGISTRY)-fpm:${1}-1.x
	docker push $(REGISTRY)-cli:${1}-1.x

	# Pushing dev images.
	docker push $(REGISTRY)-fpm:${1}-1.x-dev
	docker push $(REGISTRY)-cli:${1}-1.x-dev

endef

build:
	$(call build_image,7.2)
	$(call build_image,7.3)
	$(call build_image,7.4)

push:
	$(call push_image,7.2)
	$(call push_image,7.3)
	$(call push_image,7.4)

.PHONY: *
