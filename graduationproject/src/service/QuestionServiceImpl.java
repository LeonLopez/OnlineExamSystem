package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.QuestionsMapper;
import po.Pagination;
import po.Questions;
import vo.QuestionsListVo;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionsMapper questionsMapper;

	@Override
	public List<QuestionsListVo> getQuestionsList() {
		return questionsMapper.getQuestionsList();
	}

	@Override
	public List<QuestionsListVo> getQuestionsListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return questionsMapper.getQuestionsListByLimit(pagination);
	}

	@Override
	public int addQuestion(Questions question) {
		return questionsMapper.insertSelective(question);
	}

	@Override
	public int updateQuestion(Questions question) {
		return questionsMapper.updateByPrimaryKeySelective(question);
	}

	@Override
	public void deleteQuestionById(int id) {
		questionsMapper.deleteByPrimaryKey(id);
	}

}
