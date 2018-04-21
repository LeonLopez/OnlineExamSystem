package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	private TaotiMapper taotiMapper;

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
		int taotiid = question.getTaotiid();
		int score = question.getScore();
		UpdateTaotiVo utv = new UpdateTaotiVo(taotiid,score);
		taotiMapper.updateTotalScore(utv);
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
		QuestionsExample example = new QuestionsExample();
		Criteria criteria = example.createCriteria();
		criteria.andTaotiidEqualTo(taotiid);
		return questionsMapper.selectByExample(example);
	}

	@Override
	public Questions getQuestionById(Integer key) {
		return questionsMapper.selectByPrimaryKey(key);
	}

}
