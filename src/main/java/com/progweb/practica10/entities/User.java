package com.progweb.practica10.entities;

import javax.persistence.*;
import java.util.Set;

@Entity
public class User {

    @Id
    private String username;

    private String password;
    private boolean active;
    private String firstName;
    private String lastName;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<Role> roles;

    public User() {
    }

    public User(String username, String password, boolean active, String firstName, String lastName, Set<Role> roles) {
        this.username = username;
        this.password = password;
        this.active = active;
        this.firstName = firstName;
        this.lastName = lastName;
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
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

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
