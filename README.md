# Workspace Productivity Platform

A workspace productivity and collaboration platform built from a Spring Boot backend, MongoDB, and a Flutter mobile client.

The repository is currently an early-stage scaffold. The backend includes project and task persistence endpoints, while the mobile client currently contains a placeholder dashboard.

## Tech Stack

- **Backend:** Java 17, Spring Boot 3.3.2, Spring Web, Spring Data MongoDB, Spring Security
- **Database:** MongoDB 7
- **Mobile client:** Flutter/Dart, Provider, `http`
- **Local orchestration:** Docker Compose

## Repository Layout

```text
backend/       Spring Boot API and MongoDB repositories
mobile_client/ Flutter application
docs/          API and architecture documentation
docker-compose.yml
```

## Prerequisites

- Java 17
- Maven 3.9+ or Docker Desktop
- MongoDB 7, if running the backend outside Docker
- Flutter with Dart SDK `>=3.0.0 <4.0.0`, if running the mobile client

## Getting Started

### Run MongoDB locally

The simplest way to start the database is Docker Compose:

```bash
docker compose up -d mongo
```

This starts MongoDB with:

| Setting | Value |
| --- | --- |
| Host | `localhost` |
| Port | `27017` |
| Database | `workspace_db` |
| Username | `admin` |
| Password | `adminpass` |

### Run the backend from the command line

From the repository root:

```bash
cd backend
mvn spring-boot:run
```

The API listens on `http://localhost:8080` and uses the default MongoDB connection from `backend/src/main/resources/application.yml`.

To build the backend JAR:

```bash
mvn clean package
```

### Run the Flutter client

```bash
cd mobile_client
flutter pub get
flutter run
```

The client currently renders a placeholder Workspace Dashboard. API integration and the production dashboard are still in progress.

## API

All endpoints are currently available under `/api/v1`.

### Projects

```http
GET  /api/v1/projects
POST /api/v1/projects
```

Example project payload:

```json
{
	"name": "Website redesign",
	"description": "Plan and deliver the new website",
	"memberIds": ["user-1", "user-2"]
}
```

### Tasks

```http
GET   /api/v1/tasks/project/{projectId}
POST  /api/v1/tasks
PATCH /api/v1/tasks/{id}/status?status={status}
```

Example task payload:

```json
{
	"projectId": "project-1",
	"title": "Create wireframes",
	"description": "Prepare the first UX draft",
	"tags": ["design", "ux"]
}
```

Supported task statuses are `BACKLOG`, `IN_PROGRESS`, and `COMPLETED`. New tasks default to `BACKLOG` when no status is supplied.

## Configuration

The backend supports these environment variables:

| Variable | Default | Description |
| --- | --- | --- |
| `SPRING_DATA_MONGODB_URI` | `mongodb://localhost:27017/workspace_db` | MongoDB connection string |
| `JWT_SECRET` | `JasmineSecretKey` | JWT signing secret reserved for authentication work |
| `JWT_EXPIRATION_MS` | `86400000` | JWT expiration in milliseconds |

For anything beyond local development, replace the default database credentials and JWT secret with secure values.

## Current Status

- Project and task CRUD flows are partially implemented in the backend.
- MongoDB repositories and domain models are present.
- Authentication configuration is present, but authentication endpoints and security services are not implemented yet.
- The Flutter app is a UI placeholder and does not yet consume the API.
- Automated tests have not been added yet.

Before using the Docker Compose backend profile, fix the existing container JAR copy command in `backend/Dockerfile` and the backend port mapping in `docker-compose.yml` so the container's port `8080` is published correctly.

## Development Commands

```bash
# Start only MongoDB
docker compose up -d mongo

# Stop local services
docker compose down

# Run backend checks
cd backend
mvn test

# Analyze the Flutter client
cd mobile_client
flutter analyze
```
