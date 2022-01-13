package com.example.demo.service;

import com.example.demo.dto.UsersDto;
import com.example.demo.modles.Users;
import com.example.demo.repository.MedRepository;
import com.example.demo.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.ObjectNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;

/**
 * @author Afli Ramzi && Bahry Med Khalil
 * @apiNote  this class is an  implementation for  userservice

 */


@Slf4j
@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService , UserDetailsService  {

    private  final  UserRepository userRepository ;
    private final MedRepository medRepository;
    private final ModelMapper mapper;
    private final  PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users=userRepository.findUsersByUsername(username) ;
        if (users==null)
        {
            log.error("no user  in  db");
            throw new UsernameNotFoundException("no user  in  db");
        }
        else  {
            log.info("user  is found  : {}" ,username);
        }
        Collection<SimpleGrantedAuthority> authorities =new ArrayList<SimpleGrantedAuthority>();
        System.out.println(users.getRoles());
        users.getRoles().forEach(role -> {
            authorities.add(new SimpleGrantedAuthority(role.getName()));

        });
        return new org.springframework.security.core.userdetails.User(users.getUsername(),users.getPassword(),authorities);
    }


    @Override
    public Users saveUser(UsersDto usersDto) {
        var users=mapper.map(usersDto,Users.class );
        log.info("saving new user  {}" , users.getUsername());
        users.setPassword(passwordEncoder.encode(users.getPassword()));
           return userRepository.save(users);
    }




    @Override
    public Users getUser(String username) {
        log.info("fetching user  {}" ,username);
        return userRepository.findUsersByUsername(username);
    }




    @Override

    public int[] frequency(Long id_user, Long id_med) {
       var test =userRepository.findById(id_user);
        final int[] number = {0};
        var medicaments =test.get().getMedications();
        medicaments.forEach(medication -> {
            if(medication.getId()==id_med) {
                number[0] = number[0] +1 ;
            }
        });
       return  number;
    }

    @Override
    public String assignMedicationToUser(Long idUser, Long idMed) throws ObjectNotFoundException {
        var medications=userRepository.findById(idUser).get().getMedications();
        var medication=medRepository.findById(idMed).get();
        medications.add(medication);
        userRepository.findById(idUser).get().setMedications(medications);
       return  "done !";
    }


    @Override
    public String deleteMedicationToUser(Long idUser, Long idMed) {
        var medications=userRepository.findById(idUser).get().getMedications();
        var medication=medRepository.findById(idMed).get();
        medications.remove(medication);
        log.info(medications.toString());
        userRepository.findById(idUser).get().setMedications(medications);
        return "done !";
    }


}
