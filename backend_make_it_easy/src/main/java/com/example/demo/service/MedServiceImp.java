package com.example.demo.service;

import com.example.demo.modles.Medications;
import com.example.demo.modles.Schedule;
import com.example.demo.repository.MedRepository;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * @author Afli
 * @apiNote   this class is  an  implementation for  Medservice
 */
@Transactional
@Slf4j
@Service
public class MedServiceImp implements  MedService {

     private final  MedRepository medRepository;
    @Autowired
     MedServiceImp(MedRepository medRepository){
         this.medRepository=medRepository;

     }


    @Override
    public List<Medications> getall()  {
        List<Medications>  medications=medRepository.findAll();
        return medications;
    }

    @Override
    public  Medications getone(Long id) throws ObjectNotFoundException {
         var  medications=medRepository.findById(id).get();

        return medications;
    }

    @Override
    public Medications createMedication(Medications medications) throws ExceptionInInitializerError {
        return  medRepository.save(medications);
    }


    @Override
    public Medications update(Long id, Medications medications)  {
        var med = medRepository.findById(id);
        if (med != null) {
            medRepository.deleteById(id);
            medRepository.save(medications);
        } else {
            medRepository.save(medications);

        }
        return medications;
    }

    @Override
    public void timeToTake(  Long  idMed , Schedule schedule)  throws ObjectNotFoundException  {
        var ScheduleList=   medRepository.findById(idMed).get().getScheduleList();
        ScheduleList.add(schedule);
         medRepository.findById(idMed).get().setScheduleList(ScheduleList);

    }


}
