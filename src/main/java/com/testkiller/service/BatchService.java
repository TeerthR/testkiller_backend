package com.testkiller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.testkiller.entity.Batch;
import com.testkiller.entity.BatchEnrollment;
import com.testkiller.entity.User;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.BatchEnrollmentRepository;
import com.testkiller.repository.BatchRepository;
import com.testkiller.repository.UserRepository;

@Service
public class BatchService {

    private final BatchRepository batchRepository;
    private final BatchEnrollmentRepository batchEnrollmentRepository;
    private final UserRepository userRepository;

    public BatchService(BatchRepository batchRepository, BatchEnrollmentRepository batchEnrollmentRepository,
            UserRepository userRepository) {
        this.batchRepository = batchRepository;
        this.batchEnrollmentRepository = batchEnrollmentRepository;
        this.userRepository = userRepository;
    }

    public Batch createBatch(Batch batch) {
        batch.setIsActive(true);
        return batchRepository.save(batch);
    }

    public List<Batch> getAllBatches() {
        return batchRepository.findAll();
    }

    public Batch getBatchById(Long id) {
        return batchRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Batch not found with id: " + id));
    }

    public Batch updateBatch(Long id, Batch updatedData) {
        Batch batch = getBatchById(id);
        batch.setName(updatedData.getName());
        batch.setStartDate(updatedData.getStartDate());
        batch.setEndDate(updatedData.getEndDate());
        batch.setCapacity(updatedData.getCapacity());
        batch.setFaculty(updatedData.getFaculty());
        batch.setCourse(updatedData.getCourse());
        return batchRepository.save(batch);
    }

    public void deleteBatch(Long id) {
        Batch batch = getBatchById(id);
        batchRepository.delete(batch);
    }

    public BatchEnrollment addStudentToBatch(Long batchId, Long studentId) {
        if (batchEnrollmentRepository.existsByBatchIdAndStudentId(batchId, studentId)) {
            throw new IllegalArgumentException("Student is already enrolled in this batch");
        }
        Batch batch = getBatchById(batchId);
        User student = userRepository.findById(studentId)
                .orElseThrow(() -> new ResourceNotFoundException("Student not found with id: " + studentId));

        BatchEnrollment enrollment = new BatchEnrollment();
        enrollment.setBatch(batch);
        enrollment.setStudent(student);
        return batchEnrollmentRepository.save(enrollment);
    }

    public void removeStudentFromBatch(Long batchId, Long studentId) {
        BatchEnrollment enrollment = batchEnrollmentRepository.findByBatchIdAndStudentId(batchId, studentId)
                .orElseThrow(() -> new ResourceNotFoundException("Student not found in this batch"));
        batchEnrollmentRepository.delete(enrollment);
    }
}
