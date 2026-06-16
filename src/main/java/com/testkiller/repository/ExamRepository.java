package com.testkiller.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.Exam;
import com.testkiller.entity.enums.ExamStatus;

public interface ExamRepository extends JpaRepository<Exam, Long> {
    List<Exam> findByStatus(ExamStatus status);
}
