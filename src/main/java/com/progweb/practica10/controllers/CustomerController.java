package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Customer;
import com.progweb.practica10.repositories.CustomerRepository;

import com.progweb.practica10.repositories.RentRepository;
import com.progweb.practica10.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RentRepository rentRepository;

    @Autowired
    private UserService userService;

    private static String UPLOAD_FOLDER = new File("src/main/resources/static/img").getAbsolutePath();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getCustomers(Model model, Authentication authentication){
        model.addAttribute("userlogged", userService.findByUsername( authentication.getName()));
        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());
        model.addAttribute("customerList", customerRepository.findAllByOrderById());

        return new ModelAndView("customerList");
    }


    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getCreateCustomer(Model model, Authentication authentication){
        model.addAttribute("userlogged", userService.findByUsername( authentication.getName()));
        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());
        return new ModelAndView("createCustomer");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
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

        return "redirect:/customer/";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView getEditCustomer(@PathVariable String id, Model model, Authentication authentication){
        model.addAttribute("userlogged", userService.findByUsername( authentication.getName()));
        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());
        model.addAttribute("customer", customerRepository.findCustomerById(id));

        return new ModelAndView("editCustomer");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
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

        return "redirect:/customer/";
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public ModelAndView listCustomer(@PathVariable String id, Model model, Authentication authentication) {

        model.addAttribute("userlogged", userService.findByUsername( authentication.getName()));
        model.addAttribute("user_roles", userService.findByUsername( authentication.getName()).getRoles());

        Customer customer = customerRepository.findCustomerById(id);
        model.addAttribute("customer", customer);
        model.addAttribute("rents", rentRepository.findAllByCustomer(customer));

        List<Object[]> result = rentRepository.findAverageDaysRentedByCategory();
        List<String> categories = new ArrayList<>();
        List<Long> averages = new ArrayList<>();

        for (Object[] row : result) {
            categories.add((String) row[0]);
            averages.add(((BigInteger) row[1]).longValue());
        }
        model.addAttribute("rents_categories", categories);
        model.addAttribute("rents_average_days", averages);

        return new ModelAndView("customerDetails");
    }

    @RequestMapping(value = "/profile/{customer-id}", method = RequestMethod.POST)
    public String getProfiles(@PathVariable("customer-id") String id,
                              @RequestParam(value = "file", required = false) MultipartFile file) {

        try {
            byte[] bytes = file.getBytes();

            Path path = Paths.get(UPLOAD_FOLDER + "/" + file.getOriginalFilename());
            Files.write(path, bytes);

            Customer customer = customerRepository.findCustomerById(id);
            customer.setPhotoPath(file.getOriginalFilename());

            customerRepository.save(customer);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/customer/edit/" + id;
    }

}
