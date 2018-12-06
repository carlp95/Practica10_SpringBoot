package com.progweb.practica10.services;

import com.progweb.practica10.entities.Role;
import com.progweb.practica10.entities.User;
import com.progweb.practica10.repositories.RoleRepository;
import com.progweb.practica10.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService implements SecurityService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    private BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();


    @Transactional
    public void CreateAdmin(User user){
//        Role role = new Role("ADMIN");
//        roleRepository.save(role);
//
//        User user = new User();
//        user.setUsername("admin");
//        user.setPassword(bCryptPasswordEncoder.encode("admin123"));
//        user.setFirstName("Juanito");
//        user.setLastName("Rodríguez");
//        user.setActive(true);
//        user.setRoles(new HashSet<>(Arrays.asList(role)));
//        userRepository.save(user);
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userRepository.save(user);
    }

    @Transactional
    public User findByUsername(String username){
        return userRepository.findUserByUsername(username);
    }


    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findUserByUsername(username);

        Set<GrantedAuthority> roles = new HashSet<GrantedAuthority>();
        for (Role role : user.getRoles()){
            roles.add(new SimpleGrantedAuthority(role.getRole()));
        }

        List<GrantedAuthority> grantedAuthorities = new ArrayList<>(roles);

        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), user.isActive(), true,true,true, grantedAuthorities);
    }
}
