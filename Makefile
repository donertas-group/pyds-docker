# Set package version
VERSION = 1.1.0

# Directories & files
SHELL = /bin/sh
PROJECT_NAME = pyds-docker
REGISTRY = ghcr.io/donertas-group
IMAGE_NAME = $(REGISTRY)/$(PROJECT_NAME)
PLATFORM = linux/amd64


ARGS ?=
.PHONY: build
build: ## Build the Docker image. Use ARGS="--no-cache" to build without cache.
	@echo "Building image"
	@docker build \
		$(ARGS) \
		--platform $(PLATFORM) \
		-t $(IMAGE_NAME):$(VERSION) \
		-t $(IMAGE_NAME):latest .


.PHONY: push
push: ## Push image to GHCR
	@echo "Pushing image to GHCR"
	@docker push $(IMAGE_NAME):$(VERSION)
	@docker push $(IMAGE_NAME):latest


## Build & push image
all: build push


.PHONY: help
help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	
