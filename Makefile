include .env

.PHONY: help
help: ## display help section
	@ cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: deploy
deploy: update-worker-build ## deploy to cf workers
	@ wrangler deploy


.PHONY: dev
dev: update-worker-build ## run the project locally
	@ wrangler dev --local

update-worker-build:
	cargo install --force worker-build

# ...existing code...
