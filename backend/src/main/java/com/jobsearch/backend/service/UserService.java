package com.jobsearch.backend.service;

import com.jobsearch.backend.model.User;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * Service interface for User-related business logic.
 * Defines user operations and business rules.
 */
public interface UserService {
    User createUser(User user);
    Optional<User> findById(UUID id);
    Optional<User> findByEmail(String email);
    List<User> findAll();
    User updateUser(User user);
    void deleteUser(UUID id);
} 