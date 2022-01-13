package com.example.demo.security;

import com.example.demo.filter.CostumAuthorizationFilter;
import com.example.demo.filter.CustomAuthenticationFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


/**
 * @author  Afli  Ramzi  &&  Imen  Chihaoui
 * @apiNote  configuring  Spring  Security Lib
 */
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private  final UserDetailsService userDetailsService  ;
    private final BCryptPasswordEncoder bCryptPasswordEncoder ;
    @Override

    /**
     * @author  Afli  Ramzi
     * @param  AuthenticationManagerBuilder
     *@throws  Exception
     * @return void
     * @apiNote donc  on va haché toutes  les passwords de users  avant  les  stocké a  la bd
     */
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder) ;

    }

    /**
     * @author Afli  Ramzi
     * @param http
     * @throws Exception

     */

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.csrf().disable(); // on va desactiver  la methode  de cokkies par contre on va  utilisier  la  methode de  web  b
        http.authorizeRequests().antMatchers("/api/**").permitAll();
        //http.sessionManagement().sessionCreationPolicy(STATELESS);
        //http.authorizeRequests().antMatchers(HttpMethod.GET,"/api/users","/api//notification/**","api/").hasAuthority("Admin");
        //http.authorizeRequests().antMatchers(HttpMethod.POST,"/api/**").hasAuthority("");
        //http.authorizeRequests().antMatchers(HttpMethod.DELETE,"/api/**").hasAuthority("");
        //http.authorizeRequests().antMatchers(HttpMethod.PUT,"/api/**").hasAuthority("");

        //http.authorizeRequests().antMatchers(HttpMethod.POST,"/api/users").hasAuthority("Admin");
        //http.authorizeRequests().antMatchers(HttpMethod.POST,"/api/role","api/role/addtouser").hasAuthority("Admin");
       // http.authorizeRequests().anyRequest().authenticated();
        http.addFilterBefore(new CostumAuthorizationFilter(), UsernamePasswordAuthenticationFilter.class);
        http.addFilter(new CustomAuthenticationFilter(authenticationManagerBean()));
    }
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
         return  super.authenticationManagerBean();
    }
}
