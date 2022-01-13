package com.example.demo.service;

import com.example.demo.modles.Medications;
import com.example.demo.modles.Schedule;
import javassist.tools.rmi.ObjectNotFoundException;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @author  Wissem Matoussi && Imen Chihaoui
 * @apiNote  Here our abstract Medication service
 */
@Service
public interface MedService {
    List<Medications>  getall  () throws NullPointerException ;
     Medications getone(Long  id)  throws ObjectNotFoundException;
    Medications   createMedication(Medications medications);
    Medications update( Long id ,  Medications medications) throws Exception;
    void timeToTake(Long idMed , Schedule schedule);

}
