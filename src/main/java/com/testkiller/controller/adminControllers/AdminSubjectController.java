package com.testkiller.controller.adminControllers;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.testkiller.dto.ApiResponse;
import com.testkiller.entity.Subject;
import com.testkiller.service.SubjectService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/v1/admin/subjects")
@Tag(name = "Admin - Subjects", description = "Admin endpoints for managing subjects")
public class AdminSubjectController {

    private final SubjectService subjectService;

    public AdminSubjectController(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> createSubject(@RequestBody Subject subject) {
        Subject saved = subjectService.createSubject(subject);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Subject created successfully", saved));
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllSubjects() {
        List<Subject> subjects = subjectService.getAllSubjects();
        return ResponseEntity.ok(new ApiResponse(true, "Subjects fetched successfully", subjects));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getSubjectById(@PathVariable Long id) {
        Subject subject = subjectService.getSubjectById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Subject fetched successfully", subject));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateSubject(@PathVariable Long id, @RequestBody Subject updatedData) {
        Subject updated = subjectService.updateSubject(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Subject updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteSubject(@PathVariable Long id) {
        subjectService.deleteSubject(id);
        return ResponseEntity.ok(new ApiResponse(true, "Subject deleted successfully", null));
    }
}
