package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Device;
import com.progweb.practica10.repositories.DeviceRepository;
import com.progweb.practica10.services.DeviceServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
public class CentralController {

    @Autowired
    private DeviceServices deviceServices;

    @RequestMapping(value = "/")
    public ModelAndView home(){
        return new ModelAndView("homePage");
    }

    @RequestMapping(value = "/devices")
    public List<Device> deviceList(){
        return deviceServices.listAllDevices();
    }

//    @RequestMapping(value = "/")
}
