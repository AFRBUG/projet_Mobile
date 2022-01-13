package com.example.demo.dto;
import com.example.demo.modles.Medications;
import lombok.Data;
import java.util.List;

/**
 * @author Afli  Ramzi
 * @apiNote   Here Dto for User
 */
@Data
public class UsersDto {
    private String fullname ;
    private  String username;
    private String  password  ;
    private String  phoneNumber;
    private  String  avatar;
    //private List<Role> roles;
    private  List<Medications> medications ;


}
