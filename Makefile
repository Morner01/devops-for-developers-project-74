.PHONY: setup test dev ci build push

setup:
	docker compose run --rm app make setup

test:
	docker compose run --rm \
		-e NODE_ENV=test \
		-e TEST_DB_HOST=postgres \
		-e TEST_DB_USER=postgres \
		-e TEST_DB_PASSWORD=postgres \
		-e TEST_DB_NAME=blog_test \
		-e TEST_DB_PORT=5432 \
		app make test

dev:
	docker compose up

ci:
	docker build -t app-test -f Dockerfile .
	docker compose up -d postgres
	sleep 10
	docker compose run --rm \
		-e NODE_ENV=test \
		-e TEST_DB_HOST=postgres \
		-e TEST_DB_USER=postgres \
		-e TEST_DB_PASSWORD=postgres \
		-e TEST_DB_NAME=blog_test \
		-e TEST_DB_PORT=5432 \
		app npm test
	docker compose down

build:
	docker compose build app

push:
	docker compose push app