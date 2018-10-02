package com.progweb.practica10.services;

import com.progweb.practica10.entities.Device;
import com.progweb.practica10.repositories.DeviceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeviceServices {

    @Autowired
    private DeviceRepository deviceRepository;

    public List<Device> listAllDevices(){
        return deviceRepository.findAllByOrderById();
    }
}
