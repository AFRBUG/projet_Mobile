package com.example.demo.filter;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

/**
 * @author Afli  Ramzi
 * @apiNote   Filtring  Requests  only Authorized Request must be Accepted
 */

@Slf4j
public class CostumAuthorizationFilter extends OncePerRequestFilter {

    @Value("jwtscret")
    private  String  jwtScret;
    @Override
    //to filter request and  decide  that user have  the  authorities  to  acced  to  a specific  application
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        if(request.getServletPath().equals("/api/login") ||request.getServletPath().equals("/api/token/refrech") ){
            filterChain.doFilter(request,response);//en fait  on na pas  filtrer si il y 'a  login  donc on  va  les  passer le request vers  the  next  filter "check password"
        } else {
            String authorizationHeader =request.getHeader(AUTHORIZATION); // on va   capturer  l'authorization de  l'utilsateur
            if(authorizationHeader !=null && authorizationHeader.startsWith("Bearer")){//l'espace  apres le  mot Bearer est designé  comme la place  de  token
                try {
                    String token = authorizationHeader.substring("Bearer".length() );//on  va cherche le  token apres  le  header donc  on  va  faire  slicing c ad on  va cherche le  token qui  just  pares  le Bearer);*
                    Algorithm algorithm = Algorithm.HMAC256("jwtScret".getBytes()); // est  bien  sure  on va  asserter  l'algo  de  codeage
                    JWTVerifier  verifier = JWT.require(algorithm).build();
                    DecodedJWT decodedJWT=verifier.verify(token);
                    String username=decodedJWT.getSubject();
                    System.out.println(username);
                    System.out.println( "--------------------------------------------");
                    System.out.println( decodedJWT.getClaim("roles"));
                    /*String[] roles= decodedJWT.getClaim("roles").asArray(String.class);
                    System.out.println(roles);
                    Collection<SimpleGrantedAuthority> authorities =new ArrayList<>();


                    stream(roles).forEach(role -> {
                        authorities.add(new SimpleGrantedAuthority(role));
                    });*/

                    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken=new UsernamePasswordAuthenticationToken(username,null);
                    SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                    filterChain.doFilter(request,response);//compliter le  cycle de filtrage
                    //after  this  bloc the spring  boot  security lib so will  decide if  this user  have the authorization  to acced  in  specific application
                } catch (Exception exception) {
                    //if the  token is  not  valide  or  it is  expired
                    exception.printStackTrace();
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
                filterChain.doFilter(request,response);
            }
        }
    }


}
