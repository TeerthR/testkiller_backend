package com.testkiller.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {
}
