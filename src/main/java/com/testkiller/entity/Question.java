package com.testkiller.entity;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import com.testkiller.entity.enums.Difficulty;
import com.testkiller.entity.enums.Type;

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
@Table(name = "questions")
public class Question {

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
    @JoinColumn(name = "topic_id")
    private Topic topic;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Type type;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String questionText;

    @Column(length = 500)
    private String questionImage;

    @Column(length = 500)
    private String audioUrl;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private Difficulty difficulty = Difficulty.MEDIUM;

    @Column(nullable = false, precision = 6, scale = 2)
    private BigDecimal marks = BigDecimal.ONE;

    @Column(nullable = false, precision = 6, scale = 2)
    private BigDecimal negativeMarks = BigDecimal.ZERO;

    @Column
    private Short timeLimitSec;

    @Column(columnDefinition = "TEXT")
    private String explanation;

    @Column(length = 500)
    private String tags;

    @Column(nullable = false)
    private Boolean isActive = true;

    @Column(nullable = false, updatable = false)
    private Instant createdAt;

    @Column
    private Instant updatedAt;

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<QuestionOption> options = new ArrayList<>();

    @OneToMany(mappedBy = "question", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MatchPair> matchPairs = new ArrayList<>();

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

    public Topic getTopic() { return topic; }
    public void setTopic(Topic topic) { this.topic = topic; }

    public Type getType() { return type; }
    public void setType(Type type) { this.type = type; }

    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }

    public String getQuestionImage() { return questionImage; }
    public void setQuestionImage(String questionImage) { this.questionImage = questionImage; }

    public String getAudioUrl() { return audioUrl; }
    public void setAudioUrl(String audioUrl) { this.audioUrl = audioUrl; }

    public Difficulty getDifficulty() { return difficulty; }
    public void setDifficulty(Difficulty difficulty) { this.difficulty = difficulty; }

    public BigDecimal getMarks() { return marks; }
    public void setMarks(BigDecimal marks) { this.marks = marks; }

    public BigDecimal getNegativeMarks() { return negativeMarks; }
    public void setNegativeMarks(BigDecimal negativeMarks) { this.negativeMarks = negativeMarks; }

    public Short getTimeLimitSec() { return timeLimitSec; }
    public void setTimeLimitSec(Short timeLimitSec) { this.timeLimitSec = timeLimitSec; }

    public String getExplanation() { return explanation; }
    public void setExplanation(String explanation) { this.explanation = explanation; }

    public String getTags() { return tags; }
    public void setTags(String tags) { this.tags = tags; }

    public Boolean getIsActive() { return isActive; }
    public void setIsActive(Boolean isActive) { this.isActive = isActive; }

    public Instant getCreatedAt() { return createdAt; }
    public void setCreatedAt(Instant createdAt) { this.createdAt = createdAt; }

    public Instant getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Instant updatedAt) { this.updatedAt = updatedAt; }

    public List<QuestionOption> getOptions() { return options; }
    public void setOptions(List<QuestionOption> options) { this.options = options; }

    public List<MatchPair> getMatchPairs() { return matchPairs; }
    public void setMatchPairs(List<MatchPair> matchPairs) { this.matchPairs = matchPairs; }
}
