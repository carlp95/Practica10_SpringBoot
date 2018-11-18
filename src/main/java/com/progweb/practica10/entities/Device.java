package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
public class Device {

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String color;
    private Date issueDate;
    private boolean pending = false;
    private String company;
    private int unitsAvailable;
    private float dailyCost;

    private String photoPath;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private Category category;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private Category sub_Category;

    public Device() {
    }

    public Device(String name, String color, Date issueDate, String company, int unitsAvailable, float dailyCost, Category category, Category sub_Category) {
        this.name = name;
        this.color = color;
        this.issueDate = issueDate;
        this.company = company;
        this.unitsAvailable = unitsAvailable;
        this.dailyCost = dailyCost;
        this.category = category;
        this.sub_Category = sub_Category;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Date getIssueDate() {
        return issueDate;
    }

    public void setIssueDate(Date issueDate) {
        this.issueDate = issueDate;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getUnitsAvailable() {
        return unitsAvailable;
    }

    public void setUnitsAvailable(int unitsAvailable) {
        this.unitsAvailable = unitsAvailable;
    }

    public float getDailyCost() {
        return dailyCost;
    }

    public void setDailyCost(float dailyCost) {
        this.dailyCost = dailyCost;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Category getSub_Category() {
        return sub_Category;
    }

    public void setSub_Category(Category sub_Category) {
        this.sub_Category = sub_Category;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public boolean isPending() {
        return pending;
    }

    public void setPending(boolean pending) {
        this.pending = pending;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Device device = (Device) o;
        return Objects.equals(id, device.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
