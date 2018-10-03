package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepository extends JpaRepository<Customer, String> {

    Customer findCustomerById(String id);

    List<Customer> findAllByOrderById();
}
