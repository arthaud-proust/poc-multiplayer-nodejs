MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CWD := $(dir $(MAKEFILE_PATH))

.DEFAULT_GOAL := help

setup: setup-env ssl-generate githooks-enable serve api-jwt-setup ## Setup the project

setup-env: ## Setup docker .env file
	@echo "Copy env file"
	cp -n .env.dist .env

ssl-generate: ## Generate the SSL certificate and CA
	docker run --rm -v $(CWD)docker/traefik/certs:/root/.local/share/mkcert goodeggs/mkcert -cert-file /root/.local/share/mkcert/local-cert.pem -key-file /root/.l>
	openssl x509 -in docker/traefik/certs/rootCA.pem -inform PEM -out docker/traefik/certs/rootCA.crt

logs: ## Show docker logs
	docker compose logs --follow

serve: ## Start docker containers
	docker compose up --build -d

restart: down up ## Restart all containers

up: ## Start docker containers
	docker compose up --build -d 

down: down-containers ## Stop docker containers
	 

down-all: down-containers down-volumes ## Stop docker containers and volumes

down-containers: ## Stop docker containers
	docker compose down

down-volumes: ## Stop docker volumes
	docker compose down --volumes



.PHONY: front
front: ## Shell into the front container
	docker compose exec -u app front bash

front-logs: ## Logs front container
	docker compose logs --follow front

front-restart: ## Restart front
	docker compose stop front && docker compose up --build -d front


.PHONY: back
back: ## Shell into the back container
	docker compose exec -u app back bash

back-logs: ## Logs back container
	docker compose logs --follow back

back-restart: ## Restart back
	docker compose stop back && docker compose up --build -d back


.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
