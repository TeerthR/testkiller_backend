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
import com.testkiller.entity.Question;
import com.testkiller.service.QuestionService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/v1/admin/questions")
@Tag(name = "Admin - Questions", description = "Admin endpoints for managing questions")
public class AdminQuestionController {

    private final QuestionService questionService;

    public AdminQuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> addQuestion(@RequestBody Question question) {
        Question saved = questionService.addQuestion(question);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Question added successfully", saved));
    }

    @PostMapping("/bulk")
    public ResponseEntity<ApiResponse> addQuestions(@RequestBody List<Question> questions) {
        List<Question> saved = questionService.addQuestions(questions);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, saved.size() + " questions added successfully", saved));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getQuestionById(@PathVariable Long id) {
        Question question = questionService.getQuestionById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Question fetched successfully", question));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateQuestion(@PathVariable Long id, @RequestBody Question updatedData) {
        Question updated = questionService.updateQuestion(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Question updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteQuestion(@PathVariable Long id) {
        questionService.deleteQuestion(id);
        return ResponseEntity.ok(new ApiResponse(true, "Question deleted successfully", null));
    }
}
