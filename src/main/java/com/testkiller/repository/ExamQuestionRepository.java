package com.testkiller.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.ExamQuestion;

public interface ExamQuestionRepository extends JpaRepository<ExamQuestion, Long> {
    Optional<ExamQuestion> findByExamIdAndQuestionId(Long examId, Long questionId);
    boolean existsByExamIdAndQuestionId(Long examId, Long questionId);
}
