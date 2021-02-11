#!/usr/bin/make -f

REGISTRY=srijanlabs/influxdb
BASE_VERSION=3.13

define build_image
	# Building influxdb image.
	docker build --build-arg BASE_VERSION=${BASE_VERSION} --build-arg INFLUXDB_VERSION=${1} -t $(REGISTRY):${1}-alpine .

endef

define push_image
	docker push $(REGISTRY):${1}-alpine

endef

build:
	$(call build_image,1.8.4)
push:
	$(call push_image,1.8.4)

.PHONY: *
