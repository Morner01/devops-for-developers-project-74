.PHONY: setup test dev ci build push clean

setup:
	docker compose run --rm app make setup

test:
	docker compose run --rm app make test

dev:
	docker compose up

ci:
	docker build -t app-test -f Dockerfile .
	docker compose up -d postgres
	until docker compose exec postgres pg_isready -U postgres; do sleep 2; done
	docker run --rm \
		--network devops-for-developers-project-74_app-network \
		-e NODE_ENV=test \
		-e DB_HOST=postgres \
		-e DB_USER=postgres \
		-e DB_PASSWORD=postgres \
		-e DB_NAME=blog_test \
		-e DB_PORT=5432 \
		-v $(pwd)/app:/app \
		-w /app \
		app-test \
		sh -c "npm run migrate && npm test"
	docker compose down -v

build:
	docker compose build app

push:
	docker compose push app

clean:
	docker compose down -v
	docker system prune -f