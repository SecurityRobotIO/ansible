TAG ?= latest
PROJECT = ghcr.io/securityrobotio/ansible
IMAGE_NAME = $(PROJECT):$(TAG)
SHELL := /bin/bash
.DEFAULT_GOAL := build

build:
	docker build -t $(IMAGE_NAME) -f docker/Dockerfile ./docker

publish:
	docker push $(IMAGE_NAME)