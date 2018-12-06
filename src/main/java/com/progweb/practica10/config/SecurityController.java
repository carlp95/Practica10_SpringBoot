package com.progweb.practica10.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.sql.DataSource;

@Configurable
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityController extends WebSecurityConfigurerAdapter {


    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    private String queryUser = "select username, password, active from user where username=?";
    private String queryrole = "select u.username, r.role from user u inner join user_roles ur on(u.username=ur.user_username) inner join role r on(ur.roles_role=r.role) where u.username=?";

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
        auth.jdbcAuthentication().dataSource(dataSource).usersByUsernameQuery(queryUser).authoritiesByUsernameQuery(queryrole).passwordEncoder(bCryptPasswordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http
                .authorizeRequests()
                    .antMatchers("/","/css/**","/js/**").permitAll()
                    .antMatchers("/dbconsole/**").permitAll( )
                    .antMatchers("/admin/**").hasAnyAuthority("ADMIN")
                    .antMatchers("/home/**").hasAnyAuthority("ADMIN","USER")
                .and()
                    .formLogin()
                        .loginPage("/login")
                        .failureUrl("/login?error")
                        .defaultSuccessUrl("/home/")
                        .permitAll()
                .and()
                .logout()
                    .logoutSuccessUrl("/login")
                   .permitAll();

        http.csrf().disable();
        http.headers().frameOptions().disable();
    }

    @Bean(name = BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return super.userDetailsService();
    }


    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }
}
