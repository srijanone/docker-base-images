#!/usr/bin/make -f

REGISTRY=srijanlabs/php-fpm-nginx
BASE_VERSION=10

define build_image
	docker build --build-arg PHP_VERSION=${1} --build-arg BASE_VERSION=${BASE_VERSION} -t $(REGISTRY):${1}-${BASE_VERSION} .
	docker build --build-arg PHP_VERSION=${1} --build-arg BASE_VERSION=${BASE_VERSION}-dev -t $(REGISTRY):${1}-${BASE_VERSION}-dev .
endef

define push_image
	# Pushing production images.
	docker push $(REGISTRY):${1}-${BASE_VERSION}
	docker push $(REGISTRY):${1}-${BASE_VERSION}-dev 

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
