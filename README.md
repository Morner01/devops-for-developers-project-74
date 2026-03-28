### Hexlet tests and linter status:
[![Actions Status](https://github.com/Morner01/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Morner01/devops-for-developers-project-74/actions)
[![CI/CD](https://github.com/Morner01/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/Morner01/devops-for-developers-project-74/actions/workflows/push.yml)

## System Requirements

- Docker (версия 20.10+)
- Docker Compose (версия 2.0+)
- Make (для использования Makefile)
- Node.js 18+ (для локальной разработки)

## Docker Hub

Образ доступен на Docker Hub: [morner01/devops-for-developers-project-74:latest](https://hub.docker.com/r/morner01/devops-for-developers-project-74)

### Подготовка и запуск

# Clone repository
git clone https://github.com/morner01/devops-for-developers-project-74.git
cd devops-for-developers-project-74

# Copy the file with the environment variables
cp .env.example .env

# Install dependencies and perform database migrations
make setup

# Launch all services in development mode
make dev

# To launch in the background, use:
docker compose up -d