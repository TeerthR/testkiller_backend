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
@Table(name = "match_pairs")
public class MatchPair {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "question_id", nullable = false)
    private Question question;

    @Column(nullable = false, length = 500)
    private String leftText;

    @Column(nullable = false, length = 500)
    private String rightText;

    @Column(nullable = false)
    private Byte pairOrder = 0;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Question getQuestion() { return question; }
    public void setQuestion(Question question) { this.question = question; }

    public String getLeftText() { return leftText; }
    public void setLeftText(String leftText) { this.leftText = leftText; }

    public String getRightText() { return rightText; }
    public void setRightText(String rightText) { this.rightText = rightText; }

    public Byte getPairOrder() { return pairOrder; }
    public void setPairOrder(Byte pairOrder) { this.pairOrder = pairOrder; }
}
