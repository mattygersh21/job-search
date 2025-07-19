# Project Context

## Overview
This project is a private application designed to aid in the job search process. It automates job discovery, evaluation, and application submission, leveraging modern web technologies and automation tools.

## Goals
- Local application bootstrapped with Docker Compose (Postgres, MongoDB, backend), frontend runs from host OS browser.
- Persistent local database storage, with the ability to copy data elsewhere.
- Automated retrieval of job information from Indeed and LinkedIn.
- Evaluation of job requirements against user experience and skills to assess application worthiness.
- Storage and management of user job experience and skills for matching.
- Automated generation of resumes and cover letters for well-matched jobs, with submission and archival.
- Playwright automation for job application submission, manually or on a schedule.
- Deduplication: Only novel job opportunities are evaluated; exact matches are skipped.
- UI features to view job applications by various time spans (day, 3 days, week, month, all time). 