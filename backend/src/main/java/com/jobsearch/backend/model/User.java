package com.jobsearch.backend.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Builder;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * User entity representing a user in the job search application.
 * Maps to the 'users' table in PostgreSQL.
 */
// @Entity: Marks this class as a JPA entity that maps to a database table
@Entity
// @Table: Specifies the database table name (optional if table name matches class name)
@Table(name = "users")
// @Data: Lombok annotation that generates getters, setters, toString, equals, and hashCode methods
@Data
@NoArgsConstructor
@AllArgsConstructor
// @Builder: Lombok annotation that generates a builder pattern for creating instances
@Builder
public class User {

    // @Id: Marks this field as the primary key
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    // @Column: Maps this field to a database column with specific constraints
    // The constraints here (unique=true, nullable=false, length=255) must match the database schema
    // If they don't match, JPA validation will fail during startup
    @Column(name = "email", unique = true, nullable = false, length = 255)
    private String email;

    @Column(name = "name", nullable = false, length = 255)
    private String name;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @PrePersist
    // @PrePersist: JPA lifecycle callback - executed before entity is persisted (inserted)
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    // @PreUpdate: JPA lifecycle callback - executed before entity is updated
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
} 