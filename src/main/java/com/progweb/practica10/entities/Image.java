package com.progweb.practica10.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
@Deprecated
public class Image {
//
    @Id
    @GeneratedValue
    private Long id;

    private String path;

    public Image() {
    }

    public Image(String path) {
        this.path = path;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
