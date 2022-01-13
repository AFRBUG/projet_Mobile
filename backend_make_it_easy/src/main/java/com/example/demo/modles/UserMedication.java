package com.example.demo.modles;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMedication {

    private   Long  idUser;
    private   Long idMedication;
}
