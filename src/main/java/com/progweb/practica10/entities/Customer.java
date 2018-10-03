package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.List;

@Entity
public class Customer {

    @Id
    private String id;

    private String firstName;
    private String lastName;
    private String phone;
    private String cellPhone;
    private String address;
    private String city;

    @OneToOne(cascade = CascadeType.REMOVE)
    private Image customerPhoto;

    @OneToMany
    private List<Bill> bills;

    public Customer() {
    }

    public Customer(String id, String firstName, String lastName, String phone, String cellPhone, String address, String city, Image customerPhoto, List<Bill> bills) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.cellPhone = cellPhone;
        this.address = address;
        this.city = city;
        this.customerPhoto = customerPhoto;
        this.bills = bills;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Image getCustomerPhoto() {
        return customerPhoto;
    }

    public void setCustomerPhoto(Image customerPhoto) {
        this.customerPhoto = customerPhoto;
    }

    public List<Bill> getBills() {
        return bills;
    }

    public void setBills(List<Bill> bills) {
        this.bills = bills;
    }
}
