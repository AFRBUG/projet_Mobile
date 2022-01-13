package com.example.demo.repository;

import com.example.demo.modles.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 * @author  Afli && Bahri Med  khalil
 * @apiNote
 */
@Repository
public interface NotifRepository extends JpaRepository<Notification,Long> {

    //List<Notification> findByUser(Long User);
}
