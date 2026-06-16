package com.testkiller.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "exam_sections")
public class ExamSection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "exam_id", nullable = false)
    private Exam exam;

    @Column(nullable = false, length = 200)
    private String name;

    @Column(nullable = false)
    private Byte sectionOrder = 0;

    @Column
    private Short durationMinutes;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Exam getExam() { return exam; }
    public void setExam(Exam exam) { this.exam = exam; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Byte getSectionOrder() { return sectionOrder; }
    public void setSectionOrder(Byte sectionOrder) { this.sectionOrder = sectionOrder; }

    public Short getDurationMinutes() { return durationMinutes; }
    public void setDurationMinutes(Short durationMinutes) { this.durationMinutes = durationMinutes; }
}
