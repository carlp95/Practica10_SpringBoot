package com.progweb.practica10.entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class Category implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    private String name;
    private boolean isSubCategory;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    private Category mayorCategory;

    public Category() {
    }

    public Category(String name, boolean isSubCategory) {
        this.name = name;
        this.isSubCategory = isSubCategory;
    }

    public Category(String name, boolean isSubCategory, Category mayorCategory) {
        this.name = name;
        this.isSubCategory = isSubCategory;

        if (isSubCategory) {
            this.mayorCategory = mayorCategory;
        }
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isSubCategory() {
        return isSubCategory;
    }

    public void setSubCategory(boolean subCategory) {
        isSubCategory = subCategory;
    }

    public Category getMayorCategory() {
        return mayorCategory;
    }

    public void setMayorCategory(Category mayorCategory) {
        this.mayorCategory = mayorCategory;
    }
}
