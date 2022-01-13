package com.example.demo.modles;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.util.*;

/**
 * @author Afli  Ramzi
 * @apiNote   here  is our  Models  for MAPPING  TO  tables with JPA
 */

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
public class Medications {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private  Long id;
    private String name;
    private String description;
    @OneToMany(cascade = CascadeType.ALL)
   private List<Schedule> scheduleList=new ArrayList<>();
}
