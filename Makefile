SHELL = /bin/sh

# Directories & files
PROJECT_NAME = pyds-docker

VERSION = 1.0.0
IMAGE_NAME = ghcr.io/donertas-group/pyds-docker
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
	
