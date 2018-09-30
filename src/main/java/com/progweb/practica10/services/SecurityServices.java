package com.progweb.practica10.services;

import com.progweb.practica10.entities.Role;
import com.progweb.practica10.entities.User;
import com.progweb.practica10.repositories.RoleRepository;
import com.progweb.practica10.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class SecurityServices implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

    public void CreateAdmin(){
        Role role = new Role("Admin");
        roleRepository.save(role);

        User user = new User();

        user.setFirstName("Juanito");
        user.setLastName("Rodríguez");
        user.setActive(true);
        user.setUsername("admin");
        user.setPassword(bCryptPasswordEncoder.encode("admin123"));
        user.setRoles(new HashSet<>(Arrays.asList(role)));
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        User user = userRepository.findUserByUsername(username);

        Set<GrantedAuthority> roles = new HashSet<GrantedAuthority>();
        for (Role role : user.getRoles()){
            roles.add(new SimpleGrantedAuthority(role.getRoleName()));
        }

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>(roles);

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), user.isActive(), true,true,true,grantedAuthorities);
    }
}
