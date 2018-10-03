package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, String> {

    Customer findCustomerById(String id);
}
