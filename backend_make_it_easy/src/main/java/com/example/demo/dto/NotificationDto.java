package com.example.demo.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;



/**
 * @author Afli  Ramzi
 * @apiNote   Here Dto for Notification
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotificationDto {
    private Long   user;
    private Long  med;
    private Timestamp date;


}
