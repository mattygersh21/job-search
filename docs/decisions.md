# Key Architectural and Process Decisions

- **Backend Language & Framework:** Java with Spring Boot chosen for robust backend development and integration with both SQL and NoSQL databases.
- **Backend Architecture:** MVC pattern used for organizing controllers, services, and data access layers.
- **Frontend Framework:** Angular 18 selected for a modern, component-based UI.
- **Database Choices:**
  - PostgreSQL for structured, relational data (job listings, user profiles, application status).
  - MongoDB for unstructured documents (resumes, cover letters, submission artifacts).
- **Automation:** Playwright (Node.js) used for scraping and automating job applications on Indeed and LinkedIn.
- **Containerization:** Docker Compose orchestrates Postgres, MongoDB, and optionally the backend for local development and portability.
- **Docker Commands:** All Docker commands require `sudo` prefix due to daemon connection specifics. Use `docker compose` (not `docker-compose`) for all compose operations.
- **Frontend Execution:** Runs natively on host OS for easier development and hot-reloading.
- **Deduplication:** Only novel job opportunities are processed; exact matches are skipped to avoid redundant applications.
- **Scheduling:** Playwright can be run manually or via a scheduler (e.g., cron job) for periodic job scraping and application. 