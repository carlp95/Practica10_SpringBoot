package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class Bill {

    @Id
    @GeneratedValue
    private Long id;

    private Date issueDate;
    private String description;
    private String rentTimeLength;

    @ManyToOne
    private Customer customer;

    private float total;

    @ManyToMany
    private List<Device> devices;

    public Bill() {
    }


    public Bill(Date issueDate, String description, String rentTimeLength, Customer customer, float total, List<Device> devices) {
        this.issueDate = issueDate;
        this.description = description;
        this.rentTimeLength = rentTimeLength;
        this.customer = customer;
        this.total = total;
        this.devices = devices;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRentTimeLength() {
        return rentTimeLength;
    }

    public void setRentTimeLength(String rentTimeLength) {
        this.rentTimeLength = rentTimeLength;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public List<Device> getDevices() {
        return devices;
    }

    public void setDevices(List<Device> devices) {
        this.devices = devices;
    }
}
