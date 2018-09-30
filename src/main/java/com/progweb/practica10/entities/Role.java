package com.progweb.practica10.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Role {

    @Id
    private String roleName;

    public Role() {
    }

    public Role(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
