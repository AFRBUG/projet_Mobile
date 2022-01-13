package com.example.demo.service;

import com.example.demo.dto.UsersDto;
import com.example.demo.modles.Users;

/**
 * @author  Bahri  Med  Khalil
 * @apiNote  Here our abstract User service
 */
public interface UserService {
    Users saveUser( UsersDto usersDto) ;
    Users  getUser( String username) ;
    int[] frequency(Long idUser, Long idMed);
    String assignMedicationToUser(Long idUser ,Long idMed);
    String deleteMedicationToUser(Long idUser ,Long idMed);
}
