package com.testkiller.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.testkiller.entity.User;
import com.testkiller.entity.enums.Role;
import com.testkiller.exception.EmailAlreadyRegisteredException;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.UserRepository;

@Service
public class StudentService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public StudentService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User addStudent(User student) {
        if (userRepository.existsByEmail(student.getEmail())) {
            throw new EmailAlreadyRegisteredException("Email is already registered");
        }
        student.setRole(Role.STUDENT);
        student.setPassword(passwordEncoder.encode(student.getPassword()));
        student.setIsActive(true);
        student.setEmailVerified(false);
        return userRepository.save(student);
    }

    public List<User> getAllStudents() {
        return userRepository.findByRole(Role.STUDENT);
    }

    public User getStudentById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Student not found with id: " + id));
    }

    public User updateStudent(Long id, User updatedData) {
        User student = getStudentById(id);
        student.setFirstName(updatedData.getFirstName());
        student.setLastName(updatedData.getLastName());
        student.setMobile(updatedData.getMobile());
        student.setGender(updatedData.getGender());
        student.setDateOfBirth(updatedData.getDateOfBirth());
        student.setProfilePhotoUrl(updatedData.getProfilePhotoUrl());
        return userRepository.save(student);
    }

    public void removeStudent(Long id) {
        User student = getStudentById(id);
        userRepository.delete(student);
    }

    public void changePassword(Long id, String newPassword) {
        User student = getStudentById(id);
        student.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(student);
    }

    public void disableStudent(Long id) {
        User student = getStudentById(id);
        student.setIsActive(false);
        userRepository.save(student);
    }
}
