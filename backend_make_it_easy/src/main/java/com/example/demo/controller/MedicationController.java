package com.example.demo.controller;
import com.example.demo.dto.MedicationDto;
import com.example.demo.dto.ScheduleDto;
import com.example.demo.modles.Medications;
import com.example.demo.modles.Schedule;
import com.example.demo.repository.MedRepository;
import com.example.demo.service.MedServiceImp;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.ObjectNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author  Afli Ramzi Afli && Bahri Med  Khalil
 * @apiNote c'est  le  controller de   la  partie medication c'est  la  premiere couche qui va  recevoir  les  requets HTTP  et MQTT
 */


@RequestMapping("/api/v1/medication/")
@CrossOrigin(origins = "*")
@Controller
@Slf4j
@RestController
public class MedicationController {

    private final  MedRepository medRepository ;
    private final  MedServiceImp medServiceImp ;
    private  final  ModelMapper mapper ;

     @Autowired
    public MedicationController(MedRepository medRepository , MedServiceImp medServiceImp,ModelMapper mapper) {
        this.medRepository=medRepository ;
        this.medServiceImp=medServiceImp ;
        this.mapper=mapper ;
   }

    @GetMapping("getall")
    public List<Medications> getall(){

        return medServiceImp.getall();
    }

    @GetMapping("/{id}")
    public  Medications getone( @PathVariable Long id) {
        try {
             return  medServiceImp.getone(id);
        }catch(ObjectNotFoundException objectNotFoundException) {
            return new Medications();
        }
    }

    /**
     * @author Afli Ramzi
     * @param medicationDto
     * @return Medication
     * @apiNote  this  methode  used to   create a  mediation
      */
    @PostMapping("/create")
    public Medications createMedication(@RequestBody  MedicationDto medicationDto) {
        try {
            Medications medications =mapper.map(medicationDto , Medications.class);
            return  medServiceImp.createMedication(medications);

        }catch( ExceptionInInitializerError exception) {
            return new Medications() ;
        }
    }
    @PutMapping("/{id}")
    public Medications update(@PathVariable Long id,@RequestBody MedicationDto medicationDto){
        Medications medications=mapper.map(medicationDto ,Medications.class);
        return  medServiceImp.update(id, medications);
    }
@PostMapping("schedule/{id}")
    public void timeToTake(@PathVariable  Long  id ,@RequestBody ScheduleDto  scheduleDto) {
    try {
        var schedule = mapper.map(scheduleDto, Schedule.class);
         medServiceImp.timeToTake(id , schedule);
    }catch (ObjectNotFoundException e){
        log.info("object is not  found");
    }
}
}
