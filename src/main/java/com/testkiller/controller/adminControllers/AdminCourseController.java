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
import com.testkiller.entity.Course;
import com.testkiller.service.CourseService;

import io.swagger.v3.oas.annotations.tags.Tag;

@RestController
@RequestMapping("/api/v1/admin/courses")
@Tag(name = "Admin - Courses", description = "Admin endpoints for managing courses")
public class AdminCourseController {

    private final CourseService courseService;

    public AdminCourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @PostMapping
    public ResponseEntity<ApiResponse> createCourse(@RequestBody Course course) {
        Course saved = courseService.createCourse(course);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new ApiResponse(true, "Course created successfully", saved));
    }

    @GetMapping
    public ResponseEntity<ApiResponse> getAllCourses() {
        List<Course> courses = courseService.getAllCourses();
        return ResponseEntity.ok(new ApiResponse(true, "Courses fetched successfully", courses));
    }

    @GetMapping("/{id}")
    public ResponseEntity<ApiResponse> getCourseById(@PathVariable Long id) {
        Course course = courseService.getCourseById(id);
        return ResponseEntity.ok(new ApiResponse(true, "Course fetched successfully", course));
    }

    @PutMapping("/{id}")
    public ResponseEntity<ApiResponse> updateCourse(@PathVariable Long id, @RequestBody Course updatedData) {
        Course updated = courseService.updateCourse(id, updatedData);
        return ResponseEntity.ok(new ApiResponse(true, "Course updated successfully", updated));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ApiResponse> deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
        return ResponseEntity.ok(new ApiResponse(true, "Course deleted successfully", null));
    }
}
