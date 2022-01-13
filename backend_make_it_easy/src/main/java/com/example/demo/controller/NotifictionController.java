package com.example.demo.controller;


import com.example.demo.modles.Notification;
import com.example.demo.modles.UserMedication;
import com.example.demo.service.NotifServiceImp;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;



/**
 * @author  Afli Ramzi Afli && Bahri Med  Khalil
 * @apiNote c'est  le  controller de   la  partie Notification c'est  la  premiere couche qui va  recevoir  les  requets HTTP  et MQTT
 */

@Slf4j
@RestController
@RequestMapping("/api/v1/notifications")
@Transactional
@Controller

public class NotifictionController {

    private final  NotifServiceImp notifServiceImp ;
    private final  ModelMapper mapper;
    @Autowired
    public NotifictionController(NotifServiceImp notifServiceImp ,ModelMapper mapper){
        this.notifServiceImp=notifServiceImp ;
        this.mapper=mapper;

    }

    @GetMapping("")
    public List<Notification> allnotifcation(@RequestBody UserMedication userMedication) {
        try {
            return notifServiceImp.getnotif(userMedication.getIdUser(), userMedication.getIdMedication());
        } catch (NullPointerException nullPointerException) {

            List<Notification> notifications = new ArrayList<>();
            return notifications;
        }

    }
    @PostMapping("")
    public  Notification setnotifaction(@RequestBody Notification notification){
       // log.info(notificationDto.toString());
        //Notification notification=mapper.map(notificationDto,Notification.class);
     //   log.info("__________________________________");
        //log.info(notification.toString());

        return  notifServiceImp.setnotif(notification);
    }
    @DeleteMapping("{id}")
    public  void deletenotif(@PathVariable Long id)
    {
        try {

            notifServiceImp.deletenotif(id);
        }catch (NullPointerException nullPointerException) {
            log.info("no notification with such id :  " );
        }
    }


}
