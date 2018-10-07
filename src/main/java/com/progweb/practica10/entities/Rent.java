package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Rent {

    @Id
    @GeneratedValue
    private Long id;

    private Date rentDate;
    private Date untilDate;
    private boolean pending;
    private int deviceCount;

    @OneToOne
    private Customer customer;

    @OneToOne
    private Device device;

    public Rent() {
    }

    public Rent(Date rentDate, Date untilDate, boolean pending, int deviceCount, Customer customer, Device device) {
        this.rentDate = rentDate;
        this.untilDate = untilDate;
        this.pending = pending;
        this.deviceCount = deviceCount;
        this.customer = customer;
        this.device = device;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getRentDate() {
        return rentDate;
    }

    public void setRentDate(Date rentDate) {
        this.rentDate = rentDate;
    }

    public Date getUntilDate() {
        return untilDate;
    }

    public void setUntilDate(Date untilDate) {
        this.untilDate = untilDate;
    }

    public boolean isPending() {
        return pending;
    }

    public void setPending(boolean pending) {
        this.pending = pending;
    }

    public int getDeviceCount() {
        return deviceCount;
    }

    public void setDeviceCount(int deviceCount) {
        this.deviceCount = deviceCount;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Device getDevice() {
        return device;
    }

    public void setDevice(Device device) {
        this.device = device;
    }
}
