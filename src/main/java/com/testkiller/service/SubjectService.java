package com.testkiller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.testkiller.entity.Subject;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.SubjectRepository;

@Service
public class SubjectService {

    private final SubjectRepository subjectRepository;

    public SubjectService(SubjectRepository subjectRepository) {
        this.subjectRepository = subjectRepository;
    }

    public Subject createSubject(Subject subject) {
        subject.setIsActive(true);
        return subjectRepository.save(subject);
    }

    public List<Subject> getAllSubjects() {
        return subjectRepository.findAll();
    }

    public Subject getSubjectById(Long id) {
        return subjectRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Subject not found with id: " + id));
    }

    public Subject updateSubject(Long id, Subject updatedData) {
        Subject subject = getSubjectById(id);
        subject.setName(updatedData.getName());
        subject.setDescription(updatedData.getDescription());
        subject.setCourse(updatedData.getCourse());
        return subjectRepository.save(subject);
    }

    public void deleteSubject(Long id) {
        Subject subject = getSubjectById(id);
        subjectRepository.delete(subject);
    }
}
