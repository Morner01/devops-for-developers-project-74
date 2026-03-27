.PHONY: setup test dev ci build push

setup:
  docker compose run --rm app make setup

test:
  docker compose run --rm app make test

dev:
  docker compose up

ci:
	docker build -t app-test -f Dockerfile .
  make test

build:
  docker compose build app

push:
  docker compose push app
