# Testing Strategy

## Philosophy
- 100% test coverage goal

## Overview
Testing will be implemented across backend, frontend, and automation scripts to ensure reliability and correctness.

## Backend (Spring Boot)
- **Unit Testing:** JUnit and Mockito for business logic and service layer.
- **Integration Testing:** Spring Boot Test for API endpoints and database interactions.
- **Database Testing:** Use test containers for Postgres and MongoDB to simulate real environments.

## Frontend (Angular)
- **Unit Testing:** Jasmine and Karma for component and service testing.
- **End-to-End Testing:** Cypress for UI and workflow validation.

## Automation (Playwright)
- **Script Testing:** Playwright's built-in test runner for scraping and automation scripts.

## Known Gaps
- No tests exist yet; coverage will be tracked as features are implemented.
- Integration between Playwright and backend will require custom test scenarios. 