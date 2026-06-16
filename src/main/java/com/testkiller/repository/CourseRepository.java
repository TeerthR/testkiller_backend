package com.testkiller.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.Course;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
