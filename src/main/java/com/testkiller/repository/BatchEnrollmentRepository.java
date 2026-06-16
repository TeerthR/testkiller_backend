package com.testkiller.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.testkiller.entity.BatchEnrollment;

public interface BatchEnrollmentRepository extends JpaRepository<BatchEnrollment, Long> {
    Optional<BatchEnrollment> findByBatchIdAndStudentId(Long batchId, Long studentId);
    boolean existsByBatchIdAndStudentId(Long batchId, Long studentId);
}
