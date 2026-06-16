package com.testkiller.entity;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import com.testkiller.entity.enums.ExamStatus;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "exams")
public class Exam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "created_by", nullable = false)
    private User createdBy;

    @ManyToOne
    @JoinColumn(name = "subject_id", nullable = false)
    private Subject subject;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;

    @Column(nullable = false, length = 300)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String instructions;

    @Column(nullable = false, precision = 8, scale = 2)
    private BigDecimal totalMarks;

    @Column(nullable = false, precision = 8, scale = 2)
    private BigDecimal passingMarks;

    @Column(nullable = false)
    private Short durationMinutes;

    @Column(nullable = false)
    private Instant startDatetime;

    @Column(nullable = false)
    private Instant endDatetime;

    @Column(nullable = false)
    private Byte maxAttempts = 1;

    @Column(nullable = false)
    private Boolean shuffleQuestions = false;

    @Column(nullable = false)
    private Boolean shuffleOptions = false;

    @Column(nullable = false)
    private Boolean negativeMarking = false;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private ExamStatus status = ExamStatus.DRAFT;

    @Column(nullable = false, updatable = false)
    private Instant createdAt;

    @Column
    private Instant updatedAt;

    @OneToMany(mappedBy = "exam", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ExamSection> sections = new ArrayList<>();

    @OneToMany(mappedBy = "exam", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ExamQuestion> examQuestions = new ArrayList<>();

    @PrePersist
    protected void onCreate() {
        this.createdAt = Instant.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = Instant.now();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public User getCreatedBy() { return createdBy; }
    public void setCreatedBy(User createdBy) { this.createdBy = createdBy; }

    public Subject getSubject() { return subject; }
    public void setSubject(Subject subject) { this.subject = subject; }

    public Course getCourse() { return course; }
    public void setCourse(Course course) { this.course = course; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getInstructions() { return instructions; }
    public void setInstructions(String instructions) { this.instructions = instructions; }

    public BigDecimal getTotalMarks() { return totalMarks; }
    public void setTotalMarks(BigDecimal totalMarks) { this.totalMarks = totalMarks; }

    public BigDecimal getPassingMarks() { return passingMarks; }
    public void setPassingMarks(BigDecimal passingMarks) { this.passingMarks = passingMarks; }

    public Short getDurationMinutes() { return durationMinutes; }
    public void setDurationMinutes(Short durationMinutes) { this.durationMinutes = durationMinutes; }

    public Instant getStartDatetime() { return startDatetime; }
    public void setStartDatetime(Instant startDatetime) { this.startDatetime = startDatetime; }

    public Instant getEndDatetime() { return endDatetime; }
    public void setEndDatetime(Instant endDatetime) { this.endDatetime = endDatetime; }

    public Byte getMaxAttempts() { return maxAttempts; }
    public void setMaxAttempts(Byte maxAttempts) { this.maxAttempts = maxAttempts; }

    public Boolean getShuffleQuestions() { return shuffleQuestions; }
    public void setShuffleQuestions(Boolean shuffleQuestions) { this.shuffleQuestions = shuffleQuestions; }

    public Boolean getShuffleOptions() { return shuffleOptions; }
    public void setShuffleOptions(Boolean shuffleOptions) { this.shuffleOptions = shuffleOptions; }

    public Boolean getNegativeMarking() { return negativeMarking; }
    public void setNegativeMarking(Boolean negativeMarking) { this.negativeMarking = negativeMarking; }

    public ExamStatus getStatus() { return status; }
    public void setStatus(ExamStatus status) { this.status = status; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public Instant getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Instant updatedAt) { this.updatedAt = updatedAt; }

    public List<ExamSection> getSections() { return sections; }
    public void setSections(List<ExamSection> sections) { this.sections = sections; }

    public List<ExamQuestion> getExamQuestions() { return examQuestions; }
    public void setExamQuestions(List<ExamQuestion> examQuestions) { this.examQuestions = examQuestions; }
}
