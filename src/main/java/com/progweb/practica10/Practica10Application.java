package com.progweb.practica10;

import com.progweb.practica10.services.SecurityServices;
import org.h2.tools.Server;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.sql.SQLException;

@SpringBootApplication
public class Practica10Application {
    public static void main(String[] args) {
        try {
            Server.createTcpServer(
                    "-tcpAllowOthers",
                    "-tcpDaemon").start();
        }catch (SQLException ex){
            System.out.println("Problema con la base de datos: "+ex.getMessage());
        }
        ApplicationContext applicationContext = SpringApplication.run(Practica10Application.class, args);

        SecurityServices securityServices = (SecurityServices) applicationContext.getBean("securityServices");
        securityServices.CreateAdmin();

    }
}
