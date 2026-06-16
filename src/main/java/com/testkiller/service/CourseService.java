package com.testkiller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.testkiller.entity.Course;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.CourseRepository;

@Service
public class CourseService {

    private final CourseRepository courseRepository;

    public CourseService(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    public Course createCourse(Course course) {
        course.setIsActive(true);
        return courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getCourseById(Long id) {
        return courseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Course not found with id: " + id));
    }

    public Course updateCourse(Long id, Course updatedData) {
        Course course = getCourseById(id);
        course.setName(updatedData.getName());
        course.setDescription(updatedData.getDescription());
        course.setDurationMonths(updatedData.getDurationMonths());
        return courseRepository.save(course);
    }

    public void deleteCourse(Long id) {
        Course course = getCourseById(id);
        courseRepository.delete(course);
    }
}
