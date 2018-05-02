package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.LessonMapper;
import mapper.QuestionsMapper;
import mapper.TaotiMapper;
import po.Pagination;
import po.Questions;
import po.QuestionsExample;
import po.QuestionsExample.Criteria;
import vo.QuestionsListVo;
import vo.UpdateTaotiVo;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionsMapper questionsMapper;
	@Autowired
	private LessonMapper lessonMapper;

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
	@Transactional
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

	@Override
	public List<Questions> getQuestionListByTaotiid(Integer taotiid) {
		return questionsMapper.getQuestionListByTaotiid(taotiid);

	}

	@Override
	public Questions getQuestionById(Integer key) {
		return questionsMapper.selectByPrimaryKey(key);
	}

}