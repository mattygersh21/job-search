# Job Search Application

A private application designed to aid in the job search process by automating job discovery, evaluation, and application submission.

## Quick Start

### Prerequisites
- Docker and Docker Compose
- Java 17+ (for backend development)
- Node.js 18+ (for frontend and Playwright)

### Database Setup

**Note:** All Docker commands require `sudo` prefix due to daemon connection specifics. Use `docker compose` (not `docker-compose`) for all compose operations.

1. **Start the databases:**
   ```bash
   sudo docker compose up -d
   ```

2. **Verify the databases are running:**
   ```bash
   sudo docker compose ps
   ```

3. **Access PostgreSQL:**
   - Host: `localhost`
   - Port: `5432`
   - Database: `jobsearch`
   - Username: `jobsearch_user`
   - Password: `jobsearch_password`

4. **Access MongoDB:**
   - Host: `localhost`
   - Port: `27017`
   - Database: `jobsearch_docs`
   - Username: `jobsearch_admin`
   - Password: `jobsearch_admin_password`

### Environment Configuration

1. **Copy the example environment file:**
   ```bash
   cp env.example .env
   ```

2. **Update the `.env` file with your specific configuration**

### Stop the databases:
```bash
sudo docker compose down
```

### Reset the databases (removes all data):
```bash
sudo docker compose down -v
sudo docker compose up -d
```

## Project Structure

```
job-search/
├── docs/                    # Project documentation
├── init-scripts/           # Database initialization scripts
│   ├── postgres/           # PostgreSQL setup
│   └── mongodb/            # MongoDB setup
├── docker-compose.yml      # Database orchestration
├── env.example             # Environment variables template
└── README.md              # This file
```

## Database Schema

### PostgreSQL (Structured Data)
- **users**: User profiles and authentication
- **skills**: Available skills and categories
- **user_skills**: User-skill relationships with proficiency levels
- **job_experience**: User's work history
- **job_listings**: Scraped job postings from Indeed/LinkedIn
- **job_applications**: Application tracking and status

### MongoDB (Documents)
- **resumes**: Generated resume documents
- **cover_letters**: Generated cover letter documents
- **application_submissions**: Application artifacts and logs
- **job_scraping_logs**: Scraping activity and results

## Next Steps

1. Set up the Spring Boot backend
2. Create the Angular frontend
3. Implement Playwright scraping scripts
4. Build the job matching algorithm
5. Create the application UI

## Development

This project uses:
- **Backend**: Java 17, Spring Boot 3.x
- **Frontend**: Angular 18
- **Databases**: PostgreSQL 15, MongoDB 7.0
- **Automation**: Playwright (Node.js)
- **Containerization**: Docker Compose

For detailed architecture and decisions, see the `docs/` directory.