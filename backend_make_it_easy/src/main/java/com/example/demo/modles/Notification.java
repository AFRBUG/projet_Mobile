package com.example.demo.modles;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Timestamp;
/**
 * @author Afli  Ramzi
 * @apiNote   here  is our  Models  for MAPPING  TO  tables with JPA
 */

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id ;
    private Long userid;
    private Long  medid ;
    private Timestamp date;

}
