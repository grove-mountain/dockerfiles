include .env
export $(shell sed 's/=.*//' .env)

BUILD_ID   := $(shell git rev-parse --short HEAD 2>/dev/null || echo no-commit-id)

.DEFAULT_GOAL := help
help: ## List targets & descriptions
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

DOCKER_BUILD_ARGS := $(shell echo ${BUILD_ARGS})

build: ## Build docker image
	docker build $(DOCKER_BUILD_ARGS) -t $(IMAGE_NAME):$(VERSION) .
	docker tag $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):$(VERSION)
	docker tag $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):latest

push: ## docker push the service images tagged 'latest' & 'BUILD_ID'
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest

run: ## run docker image locally
	docker run -it $(IMAGE_NAME):$(VERSION)

clean: ## Remove the current image version
	docker image rm -f $(IMAGE_NAME):$(VERSION)
	docker image rm -f $(IMAGE_NAME):latest
