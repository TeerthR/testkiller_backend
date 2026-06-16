package com.testkiller.controller.adminControllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.testkiller.dto.ApiResponse;
import com.testkiller.entity.User;
import com.testkiller.service.StudentService;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/v1/admin/students")
@Tag(name = "Admin - Students", description = "Admin endpoints for managing students")
public class AdminStudentController {

    private final StudentService studentService;

    public AdminStudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> addStudent(@Valid @RequestBody User student) {
        User saved = studentService.addStudent(student);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Student added successfully", saved));
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllStudents() {
        List<User> students = studentService.getAllStudents();
        return ResponseEntity.ok(new ApiResponse(true, "Students fetched successfully", students));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getStudentById(@PathVariable Long id) {
        User student = studentService.getStudentById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Student fetched successfully", student));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateStudent(@PathVariable Long id, @RequestBody User updatedData) {
        User updated = studentService.updateStudent(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Student updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> removeStudent(@PathVariable Long id) {
        studentService.removeStudent(id);
        return ResponseEntity.ok(new ApiResponse(true, "Student removed successfully", null));
    }

    @PatchMapping("/{id}/password")
    public ResponseEntity<ApiResponse> changePassword(@PathVariable Long id, @RequestBody String newPassword) {
        studentService.changePassword(id, newPassword);
        return ResponseEntity.ok(new ApiResponse(true, "Password changed successfully", null));
    }

    @PatchMapping("/{id}/disable")
    public ResponseEntity<ApiResponse> disableStudent(@PathVariable Long id) {
        studentService.disableStudent(id);
        return ResponseEntity.ok(new ApiResponse(true, "Student disabled successfully", null));
    }
}
