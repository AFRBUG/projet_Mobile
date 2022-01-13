package com.example.demo.service;

import com.example.demo.modles.Notification;
import com.example.demo.repository.NotifRepository;
import com.example.demo.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Afli
 * @apiNote   this class is  an  implementation for  Notifservice
 */
@Slf4j
@Service
public class NotifServiceImp implements  NotifService {

  private  final   NotifRepository notifRepository;
  private final   UserRepository  userRepository;

    @Autowired
    NotifServiceImp( NotifRepository notifRepository, UserRepository  userRepository){
        this.notifRepository=notifRepository;
        this.userRepository=userRepository;
    }
    @Override
    public List<Notification> getnotif(Long idUser, Long idMed ) throws ObjectNotFoundException {
        List<Notification> notificationList=  notifRepository.findAll();
        log.info(notificationList.toString());
        List  <Notification> notifications=new ArrayList<Notification>();
        notificationList.forEach(notification -> {
            log.info(notification.toString());
            if(notification.getMedid().equals(idMed) && notification.getUserid().equals(idUser) ){
                notifications.add(notification);

            }
        });

        return notifications ;
    }

    @Override
    public Notification setnotif(Notification notification)
    {
        Notification notification1  = new Notification() ;
        notification1.setUserid(notification.getUserid());
        notification1.setMedid(notification.getMedid());
        notification1.setDate(notification.getDate());
        try {
            return  notifRepository.save(notification1);

        }catch (NullPointerException nullPointerException) {
            nullPointerException.printStackTrace();
            return  notification1;
        }

    }

    @Override
    public void deletenotif(Long id)  throws NullPointerException{
        log.info(notifRepository.findById(id).toString());
        notifRepository.deleteById(id);
    }


/**@Override
    public List<Notification> getMonthlyCheck(Long idUser) throws  NullPointerException {
        List<Notification> notifications=notifRepository.findByUser(idUser);
        return  notifications ;
    }
*/
}
