package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.entities.Device;
import com.progweb.practica10.entities.Rent;
import com.progweb.practica10.repositories.CustomerRepository;
import com.progweb.practica10.repositories.DeviceRepository;
import com.progweb.practica10.repositories.RentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/rent")
public class RentController {

    @Autowired
    private RentRepository rentRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private DeviceRepository deviceRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getPendingRents(Model model){
        /*List<Device> devices = deviceRepository.findAllByOrderById();
        List<Device> deviceList = new ArrayList<>();
        */
        List<Rent> rents = rentRepository.findAllByOrderById();
        List<Rent> rentsAux = new ArrayList<>();

        for (Rent rent : rents) {
//            if(rent.isPending()){
                rentsAux.add(rent);
//            }
        }

        model.addAttribute("rents", rentsAux);

        return new ModelAndView("rentList");
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getCreateRent(Model model){

        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("devices", deviceRepository.findAllByOrderById());
        model.addAttribute("todayDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()    ));

        return new ModelAndView("createRent");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createRent(@RequestParam(value = "customerID") String customerID,
                             @RequestParam(value = "date") String date,
                             @RequestParam(value = "untilDate") String untilDate,
                             @RequestParam(value = "devices") List<Long> devicesIDs) {

        try {
            Customer customer = customerRepository.findCustomerById(customerID);

            Rent rent = new Rent();

            rent.setCustomer(customer);

            Date rentDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            rent.setRentDate(rentDate);

            Date until = new SimpleDateFormat("yyyy-MM-dd").parse(untilDate);
            rent.setUntilDate(until);

            rent.setPending(true);

            List<Device> devices = new ArrayList<>();
            for (Long deviceID : devicesIDs) {
                Device dev = deviceRepository.findDeviceById(deviceID);
                dev.setUnitsAvailable(dev.getUnitsAvailable() - 1);
                deviceRepository.save(dev);

                devices.add(dev);
            }
            rent.setDevices(devices);

            rentRepository.save(rent);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "redirect:/rent/";
    }

    @RequestMapping(value = "/show/{id}")
    public ModelAndView getRentDetails(@PathVariable Long id, Model model) {
        Rent rent = rentRepository.findRentById(id);

        model.addAttribute("rent", rent);

        return new ModelAndView("rentDetails");
    }

    @RequestMapping(value = "/return/{id}", method = RequestMethod.POST)
    public String returnDevices(@PathVariable Long id) {
        Rent rent = rentRepository.findRentById(id);
        rent.setPending(false);
        rentRepository.save(rent);

        return "redirect:/rent/";
    }
}
