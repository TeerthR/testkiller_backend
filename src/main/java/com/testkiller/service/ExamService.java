package com.testkiller.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.testkiller.entity.Exam;
import com.testkiller.entity.ExamQuestion;
import com.testkiller.entity.Question;
import com.testkiller.entity.enums.ExamStatus;
import com.testkiller.exception.ResourceNotFoundException;
import com.testkiller.repository.ExamQuestionRepository;
import com.testkiller.repository.ExamRepository;
import com.testkiller.repository.QuestionRepository;

@Service
public class ExamService {

    private final ExamRepository examRepository;
    private final ExamQuestionRepository examQuestionRepository;
    private final QuestionRepository questionRepository;

    public ExamService(ExamRepository examRepository, ExamQuestionRepository examQuestionRepository,
            QuestionRepository questionRepository) {
        this.examRepository = examRepository;
        this.examQuestionRepository = examQuestionRepository;
        this.questionRepository = questionRepository;
    }

    public Exam addExam(Exam exam) {
        exam.setStatus(ExamStatus.DRAFT);
        return examRepository.save(exam);
    }

    public List<Exam> getAllExams() {
        return examRepository.findAll();
    }

    public List<Exam> getAllActiveExams() {
        return examRepository.findByStatus(ExamStatus.PUBLISHED);
    }

    public Exam getExamById(Long id) {
        return examRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Exam not found with id: " + id));
    }

    public Exam updateExam(Long id, Exam updatedData) {
        Exam exam = getExamById(id);
        exam.setTitle(updatedData.getTitle());
        exam.setDescription(updatedData.getDescription());
        exam.setInstructions(updatedData.getInstructions());
        exam.setTotalMarks(updatedData.getTotalMarks());
        exam.setPassingMarks(updatedData.getPassingMarks());
        exam.setDurationMinutes(updatedData.getDurationMinutes());
        exam.setStartDatetime(updatedData.getStartDatetime());
        exam.setEndDatetime(updatedData.getEndDatetime());
        exam.setMaxAttempts(updatedData.getMaxAttempts());
        exam.setShuffleQuestions(updatedData.getShuffleQuestions());
        exam.setShuffleOptions(updatedData.getShuffleOptions());
        exam.setNegativeMarking(updatedData.getNegativeMarking());
        exam.setSubject(updatedData.getSubject());
        exam.setCourse(updatedData.getCourse());
        return examRepository.save(exam);
    }

    public void deleteExam(Long id) {
        Exam exam = getExamById(id);
        examRepository.delete(exam);
    }

    public Exam updateExamStatus(Long id, ExamStatus status) {
        Exam exam = getExamById(id);
        exam.setStatus(status);
        return examRepository.save(exam);
    }

    public ExamQuestion assignQuestionToExam(Long examId, Long questionId) {
        if (examQuestionRepository.existsByExamIdAndQuestionId(examId, questionId)) {
            throw new IllegalArgumentException("Question is already assigned to this exam");
        }
        Exam exam = getExamById(examId);
        Question question = questionRepository.findById(questionId)
                .orElseThrow(() -> new ResourceNotFoundException("Question not found with id: " + questionId));

        ExamQuestion examQuestion = new ExamQuestion();
        examQuestion.setExam(exam);
        examQuestion.setQuestion(question);
        return examQuestionRepository.save(examQuestion);
    }

    public void removeQuestionFromExam(Long examId, Long questionId) {
        ExamQuestion examQuestion = examQuestionRepository.findByExamIdAndQuestionId(examId, questionId)
                .orElseThrow(() -> new ResourceNotFoundException("Question not found in this exam"));
        examQuestionRepository.delete(examQuestion);
    }
}
