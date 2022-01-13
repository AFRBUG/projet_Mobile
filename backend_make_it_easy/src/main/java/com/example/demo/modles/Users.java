package com.example.demo.modles;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author AFLI
 * @apiNote  TEST SPRING  BOOT  SECURITY
 */
@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long  id   ;
    private  String fullname ;
    private  String  username ;
    private  String  password  ;
    private String  phoneNumber;
    private  String  avatar;


    @ManyToMany(fetch = FetchType.EAGER)
    private List<Role> Roles=new ArrayList<Role>() ;
    @OneToMany(cascade = CascadeType.ALL)
    private List <Medications> medications =new ArrayList<Medications>();



}
