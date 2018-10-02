package com.progweb.practica10.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getLoginPage(){
        return new ModelAndView("login");
    }

    /*@RequestMapping(value = "/login", method = RequestMethod.POST)
    public String confirmLogin(@RequestParam(value = "username") String username,
                               @RequestParam(value = "password") String password){
        System.out.println(username);
        System.out.println(password);
        return "redirect:/admin/";
    }*/
}
