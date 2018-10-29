package com.progweb.practica10.repositories;


import com.progweb.practica10.entities.Category;
import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.entities.Rent;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RentRepository extends JpaRepository<Rent, Long> {

    Rent findRentById(long id);
    Rent findRentByCustomer(Customer customer);
    List<Rent> findAllByOrderById();
}
