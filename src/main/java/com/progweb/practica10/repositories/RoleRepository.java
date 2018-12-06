package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, String> {

    Role findByRole(String role);
}
