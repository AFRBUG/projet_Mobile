package com.example.demo.configuration;


import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


/**
 * @author Afli  Ramzi
 * @noteapi c'est un data transfert object  pour limiter les faillite de  securité issue de  SQL injection
 */


@Configuration
public class MaperConfig {
    @Bean
    public ModelMapper getModelMapper(){

        return new ModelMapper();
    }
}
