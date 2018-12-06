package com.progweb.practica10;

import com.progweb.practica10.entities.Role;
import com.progweb.practica10.entities.User;
import com.progweb.practica10.services.UserService;
import org.h2.tools.Server;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@SpringBootApplication()
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

        /*String[] lista = applicationContext.getBeanDefinitionNames();
        System.out.println("====== Beans Registrados =====");
        for(String bean : lista){
            System.out.println(""+bean);
        }
        System.out.println("====== FIN Beans Registrados =====");*/

        UserService userService = (UserService) applicationContext.getBean("userService");
        Set<Role> roles = new HashSet<>();
        roles.add(new Role("ADMIN"));
        userService.CreateAdmin(new User("admin","admin123",true,"Juanito","Rodríguez",roles));


    }
}
