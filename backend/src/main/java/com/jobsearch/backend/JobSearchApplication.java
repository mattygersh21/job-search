package com.jobsearch.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Main Spring Boot application class for the Job Search backend.
 * 
 * This application provides:
 * - REST APIs for job search functionality
 * - Database integration with PostgreSQL and MongoDB
 * - Job scraping and matching capabilities
 * - Resume and cover letter generation
 * - User management and authentication
 */
@SpringBootApplication
@EnableScheduling
public class JobSearchApplication {

    public static void main(String[] args) {
        SpringApplication.run(JobSearchApplication.class, args);
    }
} 