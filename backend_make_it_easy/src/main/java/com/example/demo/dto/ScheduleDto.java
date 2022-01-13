package com.example.demo.dto;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.sql.Timestamp;



/**
 * @author Afli  Ramzi
 * @apiNote   Here Dto for Schedule
 */
@Data
public class ScheduleDto {
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Timestamp date ;
    private Integer dosage ;
}
