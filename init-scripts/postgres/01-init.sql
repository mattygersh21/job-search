-- Job Search Application Database Schema
-- This script initializes the basic tables for the job search application

-- Create extensions if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Users table (for storing user profile and skills)
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Skills table
CREATE TABLE IF NOT EXISTS skills (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) UNIQUE NOT NULL,
    category VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- User skills (many-to-many relationship)
CREATE TABLE IF NOT EXISTS user_skills (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    skill_id UUID NOT NULL REFERENCES skills(id) ON DELETE CASCADE,
    proficiency_level INTEGER CHECK (proficiency_level >= 1 AND proficiency_level <= 5),
    years_experience DECIMAL(3,1),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, skill_id)
);

-- Job experience table
CREATE TABLE IF NOT EXISTS job_experience (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    company_name VARCHAR(255) NOT NULL,
    job_title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    is_current BOOLEAN DEFAULT FALSE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Education credentials table
CREATE TABLE IF NOT EXISTS education_credentials (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    credential VARCHAR(255) NOT NULL,
    credential_type VARCHAR(50) NOT NULL CHECK (credential_type IN ('degree', 'certification')),
    institution VARCHAR(255),
    completion_date DATE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Job listings table
CREATE TABLE IF NOT EXISTS job_listings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    external_id VARCHAR(255) UNIQUE NOT NULL,
    source VARCHAR(50) NOT NULL, -- 'indeed', 'linkedin', etc.
    title VARCHAR(255) NOT NULL,
    company VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    requirements TEXT,
    salary_min DECIMAL(10,2),
    salary_max DECIMAL(10,2),
    salary_currency VARCHAR(3) DEFAULT 'USD',
    job_url TEXT,
    posted_date TIMESTAMP WITH TIME ZONE,
    scraped_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    match_score DECIMAL(3,2) CHECK (match_score >= 0 AND match_score <= 1),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Job applications table
CREATE TABLE IF NOT EXISTS job_applications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    job_listing_id UUID NOT NULL REFERENCES job_listings(id) ON DELETE CASCADE,
    status VARCHAR(50) DEFAULT 'applied', -- 'applied', 'interviewed', 'rejected', 'accepted'
    applied_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    resume_document_id VARCHAR(255), -- Reference to MongoDB document
    cover_letter_document_id VARCHAR(255), -- Reference to MongoDB document
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_job_listings_source ON job_listings(source);
CREATE INDEX IF NOT EXISTS idx_job_listings_match_score ON job_listings(match_score);
CREATE INDEX IF NOT EXISTS idx_job_listings_posted_date ON job_listings(posted_date);
CREATE INDEX IF NOT EXISTS idx_job_applications_user_id ON job_applications(user_id);
CREATE INDEX IF NOT EXISTS idx_job_applications_status ON job_applications(status);
CREATE INDEX IF NOT EXISTS idx_job_applications_applied_at ON job_applications(applied_at);

-- Insert some sample skills
INSERT INTO skills (name, category) VALUES
    ('Java', 'Programming Languages'),
    ('Angular', 'Frontend'),
    ('Algorithms', 'Computer Science'),
    ('Consulting Experience', 'Professional Experience'),
    ('Linux Mint', 'Operating Systems'),
    ('RHEL', 'Operating Systems'),
    ('Ubuntu', 'Operating Systems'),
    ('Micro Frontend', 'Architecture'),
    ('Module Federation', 'Architecture'),
    ('HttpInterceptors', 'Frontend'),
    ('Route Guards', 'Frontend'),
    ('Windows', 'Operating Systems'),
    ('Object Oriented Design', 'Software Design'),
    ('Full Stack Development', 'Development'),
    ('MVC Architecture', 'Architecture'),
    ('RESTful Web Services', 'Backend'),
    ('Spring Boot/Spring MVC', 'Frameworks'),
    ('RDBMS', 'Databases'),
    ('GitHub', 'Version Control'),
    ('Bitbucket', 'Version Control'),
    ('Jira', 'Project Management'),
    ('Maestro', 'Testing'),
    ('Confluence', 'Project Management'),
    ('MapStruct', 'Tools'),
    ('Splunk', 'Monitoring'),
    ('Agile Development', 'Methodology'),
    ('Postman', 'API Testing'),
    ('JPA (Hibernate)', 'ORM'),
    ('Unit Testing', 'Testing'),
    ('Integration Testing', 'Testing'),
    ('Django', 'Frameworks'),
    ('Docker', 'DevOps'),
    ('Microservices', 'Architecture'),
    ('Code Review', 'Development Practices'),
    ('JSON', 'Data Formats'),
    ('J-Unit', 'Testing'),
    ('Roles', 'Security'),
    ('Authorization', 'Security'),
    ('Node.js', 'Runtime'),
    ('Maven', 'Build Tools'),
    ('Bash', 'Scripting'),
    ('Bash Scripting', 'Scripting'),
    ('PostgreSQL', 'Databases'),
    ('MongoDB', 'Databases'),
    ('Playwright', 'Testing'),
    ('REST API', 'Backend'),
    ('Git', 'Version Control')
ON CONFLICT (name) DO NOTHING; 