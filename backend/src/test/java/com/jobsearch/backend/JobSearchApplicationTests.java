package com.jobsearch.backend;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

/**
 * Basic integration test for the Job Search application.
 * Verifies that the Spring context loads successfully.
 */
@SpringBootTest
@ActiveProfiles("test")
class JobSearchApplicationTests {

    @Test
    void contextLoads() {
        // This test will pass if the Spring application context loads successfully
    }
} 