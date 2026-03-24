.PHONY: setup test dev docker-test docker-up

setup:
  docker-compose run --rm app make setup

test:
  docker-compose up --abort-on-container-exit

dev:
  docker-compose up

docker-test:
  docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

docker-up:
  docker-compose up
