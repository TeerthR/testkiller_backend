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
@Table(name = "question_options")
public class QuestionOption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    @Column(nullable = false, length = 1)
    private String optionLabel;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String optionText;

    @Column(length = 500)
    private String optionImage;

    @Column(nullable = false)
    private Boolean isCorrect = false;

    @Column(nullable = false)
    private Byte displayOrder = 0;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Question getQuestion() { return question; }
    public void setQuestion(Question question) { this.question = question; }

    public String getOptionLabel() { return optionLabel; }
    public void setOptionLabel(String optionLabel) { this.optionLabel = optionLabel; }

    public String getOptionText() { return optionText; }
    public void setOptionText(String optionText) { this.optionText = optionText; }

    public String getOptionImage() { return optionImage; }
    public void setOptionImage(String optionImage) { this.optionImage = optionImage; }

    public Boolean getIsCorrect() { return isCorrect; }
    public void setIsCorrect(Boolean isCorrect) { this.isCorrect = isCorrect; }

    public Byte getDisplayOrder() { return displayOrder; }
    public void setDisplayOrder(Byte displayOrder) { this.displayOrder = displayOrder; }
}
