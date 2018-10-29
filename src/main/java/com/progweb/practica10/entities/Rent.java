package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Entity
public class Rent {

    @Id
    @GeneratedValue
    private Long id;

    private Date rentDate;
    private Date untilDate;
    private boolean pending;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private List<Device> devices;

    @OneToOne
    private Customer customer;

    @OneToOne
    private Device device;

    public Rent() {
    }

    public Rent(Date rentDate, Date untilDate, boolean pending, List<Device> devices, Customer customer, Device device) {
        this.rentDate = rentDate;
        this.untilDate = untilDate;
        this.pending = pending;
        this.devices = devices;
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

    public List<Device> getDevices() {
        return devices;
    }

    public void setDevices(List<Device> devices) {
        this.devices = devices;
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

    public long daysRented() {
        long duration =  new Date().getTime() - this.getRentDate().getTime();
        return TimeUnit.DAYS.convert(duration, TimeUnit.MILLISECONDS);
    }

    public long getAverage() {
//TODO - terminar este metooo
    return 1L;

    }
}
