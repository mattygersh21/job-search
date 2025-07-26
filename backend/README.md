# Job Search Backend

Spring Boot backend application for the Job Search system.

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- PostgreSQL (running via Docker Compose)
- MongoDB (running via Docker Compose)

## Quick Start

### 1. Start the Databases

From the project root:
```bash
sudo docker compose up -d
```

### 2. Set Up Environment Variables

Copy the environment template:
```bash
cp ../env.example ../.env
```

Edit the `.env` file with your specific configuration.

### 3. Build and Run

```bash
# Build the application
mvn clean compile

# Run the application
mvn spring-boot:run
```

The application will start on `http://localhost:8080/api`

### 4. Test the Application

Health check endpoint:
```bash
curl http://localhost:8080/api/health
```

## Project Structure

```
backend/
├── src/
│   ├── main/
│   │   ├── java/com/jobsearch/backend/
│   │   │   ├── controller/     # REST controllers
│   │   │   ├── service/        # Business logic
│   │   │   ├── repository/     # Data access layer
│   │   │   ├── model/          # JPA entities
│   │   │   ├── config/         # Configuration classes
│   │   │   ├── exception/      # Custom exceptions
│   │   │   └── util/           # Utility classes
│   │   └── resources/
│   │       └── application.yml # Application configuration
│   └── test/
│       ├── java/               # Test classes
│       └── resources/
│           └── application-test.yml # Test configuration
├── pom.xml                     # Maven dependencies
└── README.md                   # This file
```

## API Endpoints

### Health Check
- `GET /api/health` - Application health status

## Development

### Running Tests
```bash
# Run all tests
mvn test

### Database Migrations
The application uses JPA with `ddl-auto: validate` in production, meaning it expects the database schema to already exist. Use the initialization scripts in the `init-scripts/` directory to set up the database schema.

### Logging
Logging is configured in `application.yml`. Set the appropriate log levels for development:
- `DEBUG` for detailed application logs
- `TRACE` for SQL parameter binding

## Configuration

### Database Configuration
- PostgreSQL: Configured via environment variables
- MongoDB: Configured via environment variables
- JPA: Uses validation mode to ensure schema consistency

### Security
- JWT-based authentication (configured but not yet implemented)
- Spring Security enabled

### Monitoring
- Spring Boot Actuator endpoints available
- Health checks for database connectivity

## Next Steps

1. Implement user authentication and authorization
2. Create job listing entities and repositories
3. Implement job matching algorithms
4. Add resume and cover letter generation
5. Integrate with external job APIs
6. Add comprehensive test coverage 