package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Device;
import com.progweb.practica10.repositories.DeviceRepository;
import com.progweb.practica10.repositories.RentRepository;
import com.progweb.practica10.services.DeviceServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.security.core.Authentication;

import java.security.Principal;
import java.util.List;

@RestController
public class CentralController {

    @Autowired
    private DeviceServices deviceServices;

    @Autowired
    private RentRepository rentRepository;

    @RequestMapping(value = "/")
    public ModelAndView home(Model model, Authentication authentication){

        //TODO cuando las categorias por clase esten listas;
        model.addAttribute("userlogged", authentication.getName());
        System.out.println("NNames auth:" +  authentication.getName());

        return new ModelAndView("homePage");

    }

    @RequestMapping(value = "/devices")
    public List<Device> deviceList(){
        return deviceServices.listAllDevices();
    }

}
