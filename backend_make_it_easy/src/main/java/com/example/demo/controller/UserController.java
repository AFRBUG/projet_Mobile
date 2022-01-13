package com.example.demo.controller;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.example.demo.dto.UsersDto;
import com.example.demo.modles.UserMedication;
import com.example.demo.modles.Users;
import com.example.demo.service.UserServiceImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.ObjectNotFoundException;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

/**
 * @author  Afli Ramzi Afli && Bahri Med  Khalil
 * @apiNote c'est  le  controller de   la  partie user c'est  la  premiere couche qui va  recevoir  les  requets HTTP  et MQTT
 */



@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/users")
@Controller
public class UserController {


private  final  ModelMapper mapper;
private final UserServiceImpl userServiceImp;
@Value("jwtscret")
private  String  jwtScret;



   /** @GetMapping("/users")
    public List<Users> getallUsers() {
          log.info("its working good  job ");
          return userService.getUsers() ;

    }*/

    @PostMapping("/create")
    public  ResponseEntity<Users> saveUser( @RequestBody UsersDto usersDto) {
        log.info(usersDto.toString());
        var users=mapper.map(usersDto,Users.class);
        return ResponseEntity.ok().body( userServiceImp.saveUser(usersDto));

    }

    @PostMapping("/assigin")
    public String assignMedicationToUser(@RequestBody UserMedication userMedication ) {
        try  {
           return   userServiceImp.assignMedicationToUser(userMedication.getIdUser(),userMedication.getIdMedication());
        }catch (ObjectNotFoundException objectNotFoundException ) {
            return  "check that user/medication exists ";
        }

    }

    @DeleteMapping("")
    public String deleteMedicationToUser(@RequestBody UserMedication userMedication){
         try {
            return  userServiceImp.deleteMedicationToUser(userMedication.getIdUser(),userMedication.getIdMedication());

         }catch(ObjectNotFoundException objectNotFoundException){
             return  "check that user/medication exists ";
         }
    }


    /**
     * @author Afli  Ramzi
     * @param request
     * @param response
     * @return token
     * @throws IOException
     * @apiNote ici  la  gestion  des Token de JWT   (only  refreshing)
     */

    @GetMapping("/token/refrech")

    public  String   refrechToken(HttpServletRequest request , HttpServletResponse response) throws IOException {
        System.out.println("under here");
        String authorizationHeader =request.getHeader(AUTHORIZATION); // on va   capturer  l'authorization de  l'utilsateu
        if(authorizationHeader !=null && authorizationHeader.startsWith("Bearer")){//l'espace  apres le  mot Bearer est designé  comme la place  de  token

            try {
                String refrech_token = authorizationHeader.substring("Bearer".length() );//on  va cherche le  token apres  le  header donc  on  va  faire  slicing c ad on  va cherche le  token qui  just  pares  le Bearer);*
                Algorithm algorithm = Algorithm.HMAC256("jwtScret".getBytes()); // est  bien  sure  on va  asserter  l'algo  de  codeage
                JWTVerifier verifier = JWT.require(algorithm).build();
                DecodedJWT decodedJWT=verifier.verify(refrech_token);
                String username=decodedJWT.getSubject();
                Users user = userServiceImp.getUser(username);
                String acces_token= JWT.create()
                        .withSubject(user.getUsername())
                        .withExpiresAt(new Date(System.currentTimeMillis()+ 10*60*1000)) //on va  definer  la dureé de  validété de  l'acces token
                        // .withIssuer(request.getRequestURL().toString())
                      //  .withClaim("roles",user.getRoles().stream().map(Role::getName).collect(Collectors.toList()))
                        .sign(algorithm);
                //cette  partie est  designé  pour  bien  formater la responce  de  token  pour  faciliter  le traitment
                response.setHeader("acces_token","refrech_token");
                Map<String,String> tokens =new HashMap<>();
                tokens.put("acces_token",acces_token);
                tokens.put("refrech_token",refrech_token);
                response.setContentType(APPLICATION_JSON_VALUE);
                new ObjectMapper().writeValue(response.getOutputStream(),tokens);

                //after  this  bloc the spring  boot  security lib so will  decide if  this user  have the authorization  to acced  in  specific application
            } catch (Exception exception) {
                //if the  token is  not  valide  or  it is  expired
                log.error(" Error logging in : {}",exception.getMessage());
                response.setHeader("error",exception.getMessage());
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                //response.sendError(FORBIDEN.value());
                Map<String,String> error =new HashMap<>();
                error.put("error_message",exception.getMessage());

                response.setContentType(APPLICATION_JSON_VALUE);
                new ObjectMapper().writeValue(response.getOutputStream(),error);
            }
        }else  {
            throw  new  RuntimeException("Refresh token is  messing");
        }
        return  "the refrech  token is  accepted";
    }




}
