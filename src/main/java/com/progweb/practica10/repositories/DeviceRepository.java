package com.progweb.practica10.repositories;

import com.progweb.practica10.entities.Device;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DeviceRepository extends JpaRepository<Device, Long> {

    Device findDeviceByName(String name);
    Device findDeviceById(Long id);
    List<Device> findAllByOrderById();

    List<Device> findAllByCategory(String category);
    List<Device> findAllByColor(String color);
    List<Device> findAllByCompany(String company);
}
