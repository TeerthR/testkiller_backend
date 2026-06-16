package com.testkiller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.testkiller.entity.Question;
import com.testkiller.entity.QuestionOption;
import com.testkiller.entity.MatchPair;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.QuestionRepository;

@Service
public class QuestionService {

    private final QuestionRepository questionRepository;

    public QuestionService(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    public Question addQuestion(Question question) {
        question.setIsActive(true);
		if (question.getOptions() != null) {
			for (QuestionOption option : question.getOptions()) {
				option.setQuestion(question);
			}
		}
		if (question.getMatchPairs() != null) {
			for (MatchPair pair : question.getMatchPairs()) {
				pair.setQuestion(question);
			}
		}
        return questionRepository.save(question);
    }

    public List<Question> addQuestions(List<Question> questions) {
        questions.forEach(q -> {
            q.setIsActive(true);
            if (q.getOptions() != null) {
                q.getOptions().forEach(o -> o.setQuestion(q));
            }
            if (q.getMatchPairs() != null) {
                q.getMatchPairs().forEach(p -> p.setQuestion(q));
            }
        });
        return questionRepository.saveAll(questions);
    }

    public Question getQuestionById(Long id) {
        return questionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Question not found with id: " + id));
    }

    public Question updateQuestion(Long id, Question updatedData) {
        Question question = getQuestionById(id);
        question.setQuestionText(updatedData.getQuestionText());
        question.setQuestionImage(updatedData.getQuestionImage());
        question.setAudioUrl(updatedData.getAudioUrl());
        question.setType(updatedData.getType());
        question.setDifficulty(updatedData.getDifficulty());
        question.setMarks(updatedData.getMarks());
        question.setNegativeMarks(updatedData.getNegativeMarks());
        question.setTimeLimitSec(updatedData.getTimeLimitSec());
        question.setExplanation(updatedData.getExplanation());
        question.setTags(updatedData.getTags());
        question.setSubject(updatedData.getSubject());
        question.setTopic(updatedData.getTopic());

		question.getOptions().clear();
		if (updatedData.getOptions() != null) {
			for (QuestionOption option : updatedData.getOptions()) {
				option.setQuestion(question);
				question.getOptions().add(option);
			}
		}

		question.getMatchPairs().clear();
		if (updatedData.getMatchPairs() != null) {
			for (MatchPair pair : updatedData.getMatchPairs()) {
				pair.setQuestion(question);
				question.getMatchPairs().add(pair);
			}
		}

        return questionRepository.save(question);
    }

    public void deleteQuestion(Long id) {
        Question question = getQuestionById(id);
        questionRepository.delete(question);
    }
}
