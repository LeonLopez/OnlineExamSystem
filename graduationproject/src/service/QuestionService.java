package service;

import java.util.List;

import po.Pagination;
import po.Questions;
import vo.QuestionsListVo;

public interface QuestionService {

	List<QuestionsListVo> getQuestionsList();

	List<QuestionsListVo> getQuestionsListByLimit(Pagination pagination);

	int addQuestion(Questions question);

	int updateQuestion(Questions question);

	void deleteQuestionById(int id);

}
