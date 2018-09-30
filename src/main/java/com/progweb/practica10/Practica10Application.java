package com.progweb.practica10;

import com.progweb.practica10.services.SecurityServices;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class Practica10Application {

    public static void main(String[] args) {
        ApplicationContext applicationContext = SpringApplication.run(Practica10Application.class, args);

        SecurityServices securityServices = (SecurityServices) applicationContext.getBean("securityServices");
        securityServices.CreateAdmin();
    }
}
