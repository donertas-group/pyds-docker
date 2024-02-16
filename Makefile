# Set package version
VERSION = 1.0.0

# Directories & files
SHELL = /bin/sh
PROJECT_NAME = pyds-docker
REGISTRY = ghcr.io/donertas-group
IMAGE_NAME = $(REGISTRY)/$(PROJECT_NAME)
PLATFORM = linux/amd64

## Build image
.PHONY: build
build:
	@echo "Building image"
	@docker build \
		--platform $(PLATFORM) \
		-t $(IMAGE_NAME):$(VERSION) \
		-t $(IMAGE_NAME):latest .

## Push image to GHCR
.PHONY: push
push:
	@echo "Pushing image to GHCR"
	@docker push $(IMAGE_NAME):$(VERSION)
	@docker push $(IMAGE_NAME):latest

## Build & push image
all: build push
	
