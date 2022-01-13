package com.example.demo.repository;

import com.example.demo.modles.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 * @author  Afli && Bahri Med  khalil
 * @apiNote
 */

@Repository
public interface UserRepository extends JpaRepository<Users,Long> {

  Users  findUsersByUsername(String  username) ;
}
