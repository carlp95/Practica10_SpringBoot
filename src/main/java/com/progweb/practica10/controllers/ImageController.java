package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

@RestController
@RequestMapping("/images")
@Deprecated
public class ImageController {

    private final CustomerRepository customerRepository;

    @Autowired
    public ImageController(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }


}
