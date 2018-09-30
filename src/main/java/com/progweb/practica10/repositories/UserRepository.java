package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {

    User findUserByUsername(String username);
}
