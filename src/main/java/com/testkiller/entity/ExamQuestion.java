package com.testkiller.entity;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "exam_questions", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"exam_id", "question_id"})
})
public class ExamQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "exam_id", nullable = false)
    private Exam exam;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    @ManyToOne
    @JoinColumn(name = "section_id")
    private ExamSection section;

    @Column(nullable = false)
    private Short displayOrder = 0;

    @Column(precision = 6, scale = 2)
    private BigDecimal marksOverride;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Exam getExam() { return exam; }
    public void setExam(Exam exam) { this.exam = exam; }

    public Question getQuestion() { return question; }
    public void setQuestion(Question question) { this.question = question; }

    public ExamSection getSection() { return section; }
    public void setSection(ExamSection section) { this.section = section; }

    public Short getDisplayOrder() { return displayOrder; }
    public void setDisplayOrder(Short displayOrder) { this.displayOrder = displayOrder; }

    public BigDecimal getMarksOverride() { return marksOverride; }
    public void setMarksOverride(BigDecimal marksOverride) { this.marksOverride = marksOverride; }
}
