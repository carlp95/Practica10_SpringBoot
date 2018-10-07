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

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getCreateRent(Model model){

        model.addAttribute("devices", deviceRepository.findAllByOrderById());

        return new ModelAndView("createRent");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createRent(@RequestParam(value = "untilDate") String untilDate,
                             @RequestParam(value = "custId") String custId, @RequestParam(value = "device") String deviceName,
                             @RequestParam(value = "counter") int dcount){

        try {
            Customer customer = customerRepository.findCustomerById(custId);
            Device device = deviceRepository.findDeviceByName(deviceName);

            Rent rent = new Rent();
            rent.setRentDate(new Date());

            Date until = new SimpleDateFormat("yyyy-MM-dd").parse(untilDate);

            rent.setUntilDate(until);

            if(rent.getRentDate() == until){
                rent.setPending(false);
            }else{
                rent.setPending(true);
            }
            rent.setCustomer(customer);
            rent.setDeviceCount(dcount);
            int available = device.getUnitsAvailable() - dcount;

            if(available > 0){
                device.setUnitsAvailable(available);
                deviceRepository.save(device);
                rent.setDevice(device);
            }else {
                /* TODO
                 * Aquí va lo que va a pasar cuando no haya articulos para alquilar */
                System.out.println("Hola");
            }
            rentRepository.save(rent);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        return "redirect:/rent/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView getPendingRents(Model model){
        /*List<Device> devices = deviceRepository.findAllByOrderById();
        List<Device> deviceList = new ArrayList<>();
        */
        List<Rent> rents = rentRepository.findAllByOrderById();
        List<Rent> rentsAux = new ArrayList<>();

        for (Rent rent : rents) {
            if(rent.isPending()){
                rentsAux.add(rent);
            }
        }

        model.addAttribute("rents", rentsAux);

        return new ModelAndView("rentList");
    }
}
