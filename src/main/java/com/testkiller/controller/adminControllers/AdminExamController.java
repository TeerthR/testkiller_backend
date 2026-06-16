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
import com.testkiller.entity.Exam;
import com.testkiller.entity.ExamQuestion;
import com.testkiller.entity.enums.ExamStatus;
import com.testkiller.service.ExamService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/v1/admin/exams")
@Tag(name = "Admin - Exams", description = "Admin endpoints for managing exams and exam questions")
public class AdminExamController {

    private final ExamService examService;

    public AdminExamController(ExamService examService) {
        this.examService = examService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> addExam(@RequestBody Exam exam) {
        Exam saved = examService.addExam(exam);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Exam created successfully", saved));
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllExams() {
        List<Exam> exams = examService.getAllExams();
        return ResponseEntity.ok(new ApiResponse(true, "Exams fetched successfully", exams));
    }

    @GetMapping("/active")
    public ResponseEntity<ApiResponse> getAllActiveExams() {
        List<Exam> exams = examService.getAllActiveExams();
        return ResponseEntity.ok(new ApiResponse(true, "Active exams fetched successfully", exams));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getExamById(@PathVariable Long id) {
        Exam exam = examService.getExamById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Exam fetched successfully", exam));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateExam(@PathVariable Long id, @RequestBody Exam updatedData) {
        Exam updated = examService.updateExam(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Exam updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteExam(@PathVariable Long id) {
        examService.deleteExam(id);
        return ResponseEntity.ok(new ApiResponse(true, "Exam deleted successfully", null));
    }

    @PatchMapping("/{id}/status")
    public ResponseEntity<ApiResponse> updateExamStatus(@PathVariable Long id, @RequestBody ExamStatus status) {
        Exam updated = examService.updateExamStatus(id, status);
        return ResponseEntity.ok(new ApiResponse(true, "Exam status updated to " + status, updated));
    }

    @PostMapping("/{examId}/questions/{questionId}")
    public ResponseEntity<ApiResponse> assignQuestionToExam(@PathVariable Long examId, @PathVariable Long questionId) {
        ExamQuestion eq = examService.assignQuestionToExam(examId, questionId);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Question assigned to exam successfully", eq));
    }

    @DeleteMapping("/{examId}/questions/{questionId}")
    public ResponseEntity<ApiResponse> removeQuestionFromExam(@PathVariable Long examId, @PathVariable Long questionId) {
        examService.removeQuestionFromExam(examId, questionId);
        return ResponseEntity.ok(new ApiResponse(true, "Question removed from exam successfully", null));
    }
}
