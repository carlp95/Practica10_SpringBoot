package com.progweb.practica10.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Device {

    @Id
    @GeneratedValue
    private Long id;

    private String name;
    private String color;
    private Date issueDate;
    private String company;
    private int unitsAvailable;
    private float dailyCost;
    private String category;
    private String sub_Category;

    public Device() {
    }

    public Device(String name, String color, Date issueDate, String company, int unitsAvailable, float dailyCost, String category, String sub_Category) {
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getSub_Category() {
        return sub_Category;
    }

    public void setSub_Category(String sub_Category) {
        this.sub_Category = sub_Category;
    }
}
