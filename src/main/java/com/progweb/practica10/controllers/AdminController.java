package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Role;
import com.progweb.practica10.entities.User;
import com.progweb.practica10.repositories.RoleRepository;
import com.progweb.practica10.repositories.UserRepository;
import com.progweb.practica10.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
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

    @Autowired
    private UserService userService;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

//    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model, HttpSession httpSession){
        return "index";
    }

//    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getSaveNewUser(Model model, Authentication authentication){

        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());

        return new ModelAndView("createUser");
    }

//    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String saveNewUser(@RequestParam(value = "username") String username,
                              @RequestParam(value = "firstName") String firstName,
                              @RequestParam(value = "lastName") String lastName,
                              @RequestParam(value = "password") String password,
                              @RequestParam(value = "status") String active,
                              @RequestParam(value = "role") String role){
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

        Role role1 = roleRepository.findByRole(role);
        if(role1 != null){
            user.setRoles(new HashSet<>(Arrays.asList(role1)));
        }else {
            Role newRole = new Role(role);
            roleRepository.save(newRole);
        }
        userRepository.save(user);
        return "redirect:/userList";
    }

//    @Secured({"ROLE_ADMIN"})
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView getUserList(Model model, Authentication authentication){

        model.addAttribute("userList", userRepository.findAll());
        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());

        return new ModelAndView("userList");
    }
}
