package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Role;
import com.progweb.practica10.entities.User;
import com.progweb.practica10.repositories.RoleRepository;
import com.progweb.practica10.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    @Secured({"ROLE_Admin"})
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, HttpSession httpSession){
        return "index";
    }

    @Secured({"ROLE_Admin"})
    @RequestMapping(value = "/createUser", method = RequestMethod.GET)
    public ModelAndView getSaveNewUser(){

        return new ModelAndView("createUser");
    }

    @Secured({"ROLE_Admin"})
    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String saveNewUser(@RequestParam String username, @RequestParam String firstName, @RequestParam String lastName,
                              @RequestParam String city, @RequestParam String password, @RequestParam String active, @RequestParam String role){
        User user = new User();
        user.setUsername(username);
        user.setPassword(bCryptPasswordEncoder.encode(password));
        user.setFirstName(firstName);
        user.setLastName(lastName);
        if(active.equalsIgnoreCase("active")){
            user.setActive(true);
        }else if(active.equalsIgnoreCase("no_active")){
            user.setActive(false);
        }

        Role role1 = roleRepository.findByRoleName(role);
        if(role1 != null){
            user.setRoles(new HashSet<>(Arrays.asList(role1)));
        }else {
            Role newRole = new Role(role);
            roleRepository.save(newRole);
        }
        userRepository.save(user);
        return "";
    }
}
