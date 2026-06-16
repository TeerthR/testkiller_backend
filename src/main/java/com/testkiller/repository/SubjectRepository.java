package com.testkiller.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.Subject;

public interface SubjectRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByCourseId(Long courseId);
}
