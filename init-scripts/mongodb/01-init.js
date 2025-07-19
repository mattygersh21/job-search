// Job Search Application MongoDB Schema
// This script initializes the basic collections for the job search application

// Switch to the jobsearch_docs database
db = db.getSiblingDB('jobsearch_docs');

// Create collections
db.createCollection('resumes');
db.createCollection('cover_letters');
db.createCollection('application_submissions');
db.createCollection('job_scraping_logs');

// Create indexes for better performance
db.resumes.createIndex({ "userId": 1 });
db.resumes.createIndex({ "createdAt": -1 });
db.resumes.createIndex({ "jobListingId": 1 });

db.cover_letters.createIndex({ "userId": 1 });
db.cover_letters.createIndex({ "createdAt": -1 });
db.cover_letters.createIndex({ "jobListingId": 1 });

db.application_submissions.createIndex({ "userId": 1 });
db.application_submissions.createIndex({ "jobListingId": 1 });
db.application_submissions.createIndex({ "submittedAt": -1 });
db.application_submissions.createIndex({ "status": 1 });

db.job_scraping_logs.createIndex({ "source": 1 });
db.job_scraping_logs.createIndex({ "scrapedAt": -1 });
db.job_scraping_logs.createIndex({ "status": 1 });

// Insert sample resume template
db.resumes.insertOne({
    _id: ObjectId(),
    userId: "sample-user-id",
    jobListingId: "sample-job-id",
    template: "default",
    content: {
        personalInfo: {
            name: "Sample User",
            email: "sample@example.com",
            phone: "+1-555-0123",
            location: "San Francisco, CA",
            linkedin: "https://linkedin.com/in/sampleuser"
        },
        summary: "Experienced software engineer with expertise in Java, Spring Boot, and modern web technologies.",
        experience: [
            {
                company: "Tech Company",
                title: "Senior Software Engineer",
                startDate: "2020-01-01",
                endDate: "2023-12-31",
                description: "Developed and maintained microservices using Java and Spring Boot."
            }
        ],
        skills: [
            "Java", "Spring Boot", "Angular", "PostgreSQL", "MongoDB", "Docker"
        ],
        education: [
            {
                degree: "Bachelor of Science in Computer Science",
                school: "University of Technology",
                graduationYear: 2019
            }
        ]
    },
    createdAt: new Date(),
    updatedAt: new Date()
});

// Insert sample cover letter template
db.cover_letters.insertOne({
    _id: ObjectId(),
    userId: "sample-user-id",
    jobListingId: "sample-job-id",
    template: "default",
    content: {
        recipient: "Hiring Manager",
        company: "Sample Company",
        opening: "I am writing to express my interest in the Software Engineer position at Sample Company.",
        body: "With my experience in Java development and modern web technologies, I believe I would be a great fit for your team.",
        closing: "I look forward to discussing how my skills and experience can contribute to your organization.",
        signature: "Sample User"
    },
    createdAt: new Date(),
    updatedAt: new Date()
});

print("MongoDB initialization completed successfully!"); 