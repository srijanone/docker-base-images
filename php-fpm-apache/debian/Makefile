#!/usr/bin/make -f

REGISTRY=srijanlabs/php-fpm-apache
BASE_VERSION=buster

define build_image
	# Build production image.
	docker build --build-arg PHP_VERSION=${1} --build-arg BASE_VERSION=${BASE_VERSION} -t $(REGISTRY):${1}-${BASE_VERSION} .
	# Build dev image.
	docker build --build-arg PHP_VERSION=${1} --build-arg BASE_VERSION=${BASE_VERSION}-dev -t $(REGISTRY):${1}-${BASE_VERSION}-dev .
endef

define push_image
	# Push production image.
	docker push $(REGISTRY):${1}-${BASE_VERSION}
	# Push dev image.
	docker push $(REGISTRY):${1}-${BASE_VERSION}-dev 

endef

build:
	# Deprecating php version 7.2
	# $ (call build_image,7.2)

	$(call build_image,7.3)
	$(call build_image,7.4)

push:
	# Deprecating php version 7.2
	# $ (call build_image,7.2)
	
	$(call push_image,7.3)
	$(call push_image,7.4)

.PHONY: *
