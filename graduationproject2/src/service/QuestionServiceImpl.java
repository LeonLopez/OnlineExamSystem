package service;

import java.util.HashMap;
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
import vo.AutoMakeTaotiVo;
import vo.ParamVo;
import vo.QuestionsListVo;
import vo.QuestionsQueryVo;
import vo.TaotiQuestionIdsVo;
import vo.TaotiQuestionsVo;
import vo.UpdateTaotiVo;

@Service
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionsMapper questionsMapper;
	@Autowired
	private LessonMapper lessonMapper;

	@Override
	public List<QuestionsListVo> getQuestionsList(Questions question) {
		return questionsMapper.getQuestionsList(question);
	}

	@Override
	public List<QuestionsListVo> getQuestionsListByLimit(Pagination pagination, Questions question) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		HashMap <String,Object> map=new HashMap<String,Object>();

		map.put("startPage",pagination.getStartPage());

		map.put("rows",pagination.getRows());
		
		map.put("lessonid",question.getLessonid());
		map.put("knowledgeid",question.getKnowledgeid());
		map.put("type",question.getType());
		map.put("difficulty",question.getDifficulty());
		
		return questionsMapper.getQuestionsListByLimit(map);
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
	public List<TaotiQuestionsVo> getQuestionListByTaotiid(Integer taotiid) {
		return questionsMapper.getQuestionListByTaotiid(taotiid);

	}

	@Override
	public Questions getQuestionById(Integer key) {
		return questionsMapper.selectByPrimaryKey(key);
	}

	

	@Override
	public List<QuestionsListVo> getQuestionsListByLessonIdAndLimit(Pagination pagination, Integer lessonid) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		ParamVo paramVo = new ParamVo();
		paramVo.setId(lessonid);
		paramVo.setPagination(pagination);
		return questionsMapper.getQuestionsListByLessonIdAndLimit(paramVo);
	}

	@Override
	public List<QuestionsListVo> getQuestionsListByLessonId(QuestionsQueryVo qqv) {
		return questionsMapper.getQuestionsListByLessonId(qqv);
	}

	@Override
	public List<Questions> getQuestionListByAutoMakeTaotiVo(AutoMakeTaotiVo amtv) {
		return questionsMapper.getQuestionListByAutoMakeTaotiVo(amtv);
	}

	@Override
	public TaotiQuestionsVo getTaotiQuestionByTaotiQuestionIds(int taotiid, Integer key) {
		TaotiQuestionIdsVo tqIdsVo = new TaotiQuestionIdsVo();
		tqIdsVo.setTaotiid(taotiid);
		tqIdsVo.setQuestionid(key);
		return questionsMapper.getTaotiQuestionByTaotiQuestionIds(tqIdsVo);
	}

	

	

}
