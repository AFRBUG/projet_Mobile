package com.example.demo;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author  Bahry  Med  Khalil &&  Wissem Matoussi && Imen Chiahoui   &&  Ramzi  Afli
 * @apiNote  here is  our main  application
 */
@EnableCaching
@SpringBootApplication
public class SpringSecurityApplication{

	public static void main(String[] args) {
		SpringApplication.run(SpringSecurityApplication.class, args);
	}

	/**
	 * @apiNote  Krypting  password  before saving  it

 	 */
	@Bean
	PasswordEncoder passwordEncoder () {
		return new BCryptPasswordEncoder();
	}





}
