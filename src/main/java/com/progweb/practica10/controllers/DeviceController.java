package com.progweb.practica10.controllers;

import com.progweb.practica10.entities.Category;
import com.progweb.practica10.entities.Device;
import com.progweb.practica10.repositories.DeviceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
@RequestMapping("/device")
public class DeviceController {

    private final DeviceRepository deviceRepository;

    @Autowired
    public DeviceController(DeviceRepository deviceRepository) {
        this.deviceRepository = deviceRepository;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView getAllDevices(Model model){
        model.addAttribute("deviceList", deviceRepository.findAllByOrderById());
        return new ModelAndView("devicesList");
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView getCreateDevice(){
        return new ModelAndView("createDevice");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createDevice(@RequestParam(value = "deviceName") String name, @RequestParam(value = "color") String color,
                               @RequestParam(value = "issueDate") Date issueDate, @RequestParam(value = "company") String company,
                               @RequestParam(value = "unitsAvailabe") int unitsAvailable, @RequestParam(value = "dailyCost") float dailyCost,
                               @RequestParam(value = "category") Category category, @RequestParam(value = "sub_Category") Category sub_category){
        Device device = new Device();

        device.setName(name);
        device.setColor(color);
        device.setIssueDate(issueDate);
        device.setCompany(company);
        device.setUnitsAvailable(unitsAvailable);
        device.setDailyCost(dailyCost);
        device.setCategory(category);
        device.setSub_Category(sub_category);
        device.setPhotoPath("");

        deviceRepository.save(device);
        return "redirect:/device";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView getEditDevice(@PathVariable(value = "id") long id, Model model){
        Device device = deviceRepository.findDeviceById(id);
        model.addAttribute("device", device);
        return new ModelAndView("editDevice");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editDevice(@RequestParam(value = "identification") long id, @RequestParam(value = "deviceName") String name, @RequestParam(value = "color") String color,
                             @RequestParam(value = "issueDate") Date issueDate, @RequestParam(value = "company") String company,
                             @RequestParam(value = "unitsAvailabe") int unitsAvailable, @RequestParam(value = "dailyCost") float dailyCost,
                             @RequestParam(value = "category") Category category, @RequestParam(value = "sub_Category") Category sub_category){

        Device device = deviceRepository.findDeviceById(id);
        device.setName(name);
        device.setColor(color);
        device.setIssueDate(issueDate);
        device.setCompany(company);
        device.setUnitsAvailable(unitsAvailable);
        device.setDailyCost(dailyCost);
        device.setCategory(category);
        device.setSub_Category(sub_category);
        deviceRepository.save(device);

        return "redirect:/device";
    }


}
