#!/usr/bin/make -f

REGISTRY=srijanlabs/php
BASE_VERSION=10


define build_image
	# Building production images.
	docker build  --build-arg BASE_VERSION=${BASE_VERSION} --build-arg PHP_VERSION=${1} -t $(REGISTRY):${1}-${BASE_VERSION} base
	docker build  --build-arg BASE_VERSION=${BASE_VERSION} --build-arg PHP_VERSION=${1} -t $(REGISTRY)-fpm:${1}-${BASE_VERSION} fpm
	docker build  --build-arg BASE_VERSION=${BASE_VERSION} --build-arg PHP_VERSION=${1} -t $(REGISTRY)-cli:${1}-${BASE_VERSION} cli

	# Building dev images.
	docker build  --build-arg BASE_VERSION=${BASE_VERSION} --build-arg PHP_VERSION=${1} -t $(REGISTRY)-fpm:${1}-${BASE_VERSION}-dev dev

endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-${BASE_VERSION}
	docker push $(REGISTRY)-fpm:${1}-${BASE_VERSION}
	docker push $(REGISTRY)-cli:${1}-${BASE_VERSION}

	# Pushing dev images.
	docker push $(REGISTRY)-fpm:${1}-${BASE_VERSION}-dev

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
