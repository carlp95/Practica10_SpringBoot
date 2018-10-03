package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.repositories.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;


    @RequestMapping(value = "/createcustomer", method = RequestMethod.GET)
    public ModelAndView getCreateCustomer(Model model){

        return new ModelAndView("createCustomer");
    }

    @RequestMapping(value = "/createcustomer", method = RequestMethod.POST)
    public String createCustomer(@RequestParam(value = "identification") String id, @RequestParam(value = "firstName") String firstName,
                                       @RequestParam(value = "lastName") String lastName, @RequestParam(value = "phone") String phone,
                                       @RequestParam(value = "cellPhone") String cellPhone, @RequestParam(value = "address") String address,
                                       @RequestParam(value = "city") String city){
        Customer customer = new Customer();

        customer.setId(id);
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setAddress(address);
        customer.setPhone(phone);
        customer.setCellPhone(cellPhone);
        customer.setCity(city);
        customerRepository.save(customer);

        return "redirect:/customerList";
    }

    @RequestMapping(value = "/customerlist", method = RequestMethod.GET)
    public ModelAndView getCustomers(Model model){

        model.addAttribute("custList", customerRepository.findAllByOrderById());

        return new ModelAndView("customerList");
    }

    @RequestMapping(value = "/editcustomer/{id}", method = RequestMethod.GET)
    public ModelAndView getEditCustomer(@PathVariable String id, Model model){

        model.addAttribute("customer", customerRepository.findCustomerById(id));

        return new ModelAndView("editCustomer");
    }

    @RequestMapping(value = "/editcustomer", method = RequestMethod.POST)
    public String editCustomer(@RequestParam(value = "identification") String id, @RequestParam(value = "firstName") String firstName,
                               @RequestParam(value = "lastName") String lastName, @RequestParam(value = "phone") String phone,
                               @RequestParam(value = "cellPhone") String cellPhone, @RequestParam(value = "address") String address,
                               @RequestParam(value = "city") String city){
        Customer customer = customerRepository.findCustomerById(id);

        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setAddress(address);
        customer.setPhone(phone);
        customer.setCellPhone(cellPhone);
        customer.setCity(city);
        customerRepository.save(customer);

        return "redirect:/customerList";
    }
}
