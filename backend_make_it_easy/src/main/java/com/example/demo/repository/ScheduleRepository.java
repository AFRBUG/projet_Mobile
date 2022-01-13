package com.example.demo.repository;

import com.example.demo.modles.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 * @author  Afli && Bahri Med  khalil
 * @apiNote
 */
@Repository
public interface ScheduleRepository extends JpaRepository<Schedule,Long> {
}
