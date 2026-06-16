package com.testkiller.entity;

import java.time.Instant;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(name = "batch_enrollments", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"batch_id", "student_id"})
})
public class BatchEnrollment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "batch_id", nullable = false)
    private Batch batch;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private User student;

    @Column(nullable = false, updatable = false)
    private Instant enrolledAt;

    @PrePersist
    protected void onCreate() {
        this.enrolledAt = Instant.now();
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Batch getBatch() { return batch; }
    public void setBatch(Batch batch) { this.batch = batch; }

    public User getStudent() { return student; }
    public void setStudent(User student) { this.student = student; }

    public Instant getEnrolledAt() { return enrolledAt; }
    public void setEnrolledAt(Instant enrolledAt) { this.enrolledAt = enrolledAt; }
}
