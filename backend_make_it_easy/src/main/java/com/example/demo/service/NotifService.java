package com.example.demo.service;
import com.example.demo.modles.Notification;
import org.springframework.stereotype.Service;
import java.util.List;


/**
 * @author  Wissem Matoussi && Imen Chihaoui
 * @apiNote  Here our abstract Notification service
 */
@Service
public interface NotifService {

     List<Notification> getnotif(Long idUser, Long idMed);
     Notification setnotif(Notification notification);
     void deletenotif(Long id);
    //List <Notification>getMonthlyCheck(Long  idUser) ;

}
