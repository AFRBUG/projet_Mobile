package com.example.demo.dto;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.sql.Timestamp;


/**
 * @author Afli  Ramzi
 * @apiNote   Here Dto for Medication
 */
@Data
public class MedicationDto {

    private String name;
    private String description;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Timestamp scheduleList;
}
