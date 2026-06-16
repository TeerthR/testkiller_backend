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
import com.testkiller.entity.Batch;
import com.testkiller.entity.BatchEnrollment;
import com.testkiller.service.BatchService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/v1/admin/batches")
@Tag(name = "Admin - Batches", description = "Admin endpoints for managing batches and enrollments")
public class AdminBatchController {

    private final BatchService batchService;

    public AdminBatchController(BatchService batchService) {
        this.batchService = batchService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> createBatch(@RequestBody Batch batch) {
        Batch saved = batchService.createBatch(batch);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Batch created successfully", saved));
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllBatches() {
        List<Batch> batches = batchService.getAllBatches();
        return ResponseEntity.ok(new ApiResponse(true, "Batches fetched successfully", batches));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getBatchById(@PathVariable Long id) {
        Batch batch = batchService.getBatchById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Batch fetched successfully", batch));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateBatch(@PathVariable Long id, @RequestBody Batch updatedData) {
        Batch updated = batchService.updateBatch(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Batch updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteBatch(@PathVariable Long id) {
        batchService.deleteBatch(id);
        return ResponseEntity.ok(new ApiResponse(true, "Batch deleted successfully", null));
    }

    @PostMapping("/{batchId}/students/{studentId}")
    public ResponseEntity<ApiResponse> addStudentToBatch(@PathVariable Long batchId, @PathVariable Long studentId) {
        BatchEnrollment enrollment = batchService.addStudentToBatch(batchId, studentId);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Student added to batch successfully", enrollment));
    }

    @DeleteMapping("/{batchId}/students/{studentId}")
    public ResponseEntity<ApiResponse> removeStudentFromBatch(@PathVariable Long batchId, @PathVariable Long studentId) {
        batchService.removeStudentFromBatch(batchId, studentId);
        return ResponseEntity.ok(new ApiResponse(true, "Student removed from batch successfully", null));
    }
}
