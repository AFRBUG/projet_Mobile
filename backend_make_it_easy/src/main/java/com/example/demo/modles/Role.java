package com.example.demo.modles;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;


/**
 * @author   afli
 * @apiNote   c'est le role de  user  pour assurer l'authorization
 */
@Data
@Table
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;
    private  String name ;

}
