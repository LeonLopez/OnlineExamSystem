package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.QuestionsMapper;
import mapper.TaotiMapper;
import mapper.TaotiquestionMapper;
import po.Questions;
import po.Taoti;
import po.Taotiquestion;
import po.TaotiquestionExample;
import po.TaotiquestionExample.Criteria;
import po.TaotiquestionKey;

@Service
public class TaotiquestionServiceImpl implements TaotiquestionService {
	
	@Autowired
	private TaotiquestionMapper taotiquestionMapper;
	
	@Autowired
	private QuestionsMapper questionMapper;
	@Autowired
	private TaotiMapper taotiMapper;

	@Override
	public List<Taotiquestion> getTaotiQuestion(int taotiid, int questionid) {
		TaotiquestionExample example = new TaotiquestionExample();
		Criteria criteria = example.createCriteria();
		criteria.andTaotiidEqualTo(taotiid);
		criteria.andQuestionidEqualTo(questionid);
		
		return taotiquestionMapper.selectByExample(example);
	}

	@Override
	@Transactional
	public void deleteQuestionFromTaoti(Integer taotiid, Integer questionid) {
		
		TaotiquestionKey key = new TaotiquestionKey();
		key.setTaotiid(taotiid);
		key.setQuestionid(questionid);
		Taotiquestion taotiquestion = taotiquestionMapper.selectByPrimaryKey(key);
		Questions question = questionMapper.selectByPrimaryKey(questionid);
		Taoti taoti = taotiMapper.selectByPrimaryKey(taotiid);
		int score = taotiquestion.getScore();
		if(question.getType().equals("单选")){
			taoti.setSinglenum(taoti.getSinglenum()-1);
			taoti.setSinglescore(taoti.getSinglescore()-score);
		}
		if(question.getType().equals("多选")){
			taoti.setMultinum(taoti.getMultinum()-1);
			taoti.setMultiscore(taoti.getMultiscore()-score);
		}
		if(question.getType().equals("判断")){
			taoti.setTrueorfalsenum(taoti.getTrueorfalsenum()-1);
			taoti.setTrueorfalsescore(taoti.getTrueorfalsescore()-score);
		}
		taoti.setTotalscore(taoti.getTotalscore()-score);
		if(question.getDifficulty().equals("简单")){
			taoti.setEasyscore(taoti.getEasyscore()-score);
		}
		if(question.getDifficulty().equals("一般")){
			taoti.setOrdinaryscore(taoti.getOrdinaryscore()-score);
		}
		if(question.getDifficulty().equals("困难")){
			taoti.setDifficultscore(taoti.getDifficultscore()-score);
		}
		if(taoti.getEasyscore()>taoti.getOrdinaryscore() && taoti.getEasyscore()>taoti.getDifficultscore()){
			taoti.setDifficultylevel("简单");
		}
		if(taoti.getOrdinaryscore()>taoti.getEasyscore() && taoti.getOrdinaryscore()>taoti.getDifficultscore()){
			taoti.setDifficultylevel("一般");
		}
		if(taoti.getDifficultscore()>taoti.getEasyscore() && taoti.getDifficultscore()>taoti.getOrdinaryscore()){
			taoti.setDifficultylevel("困难");
		}
		taotiMapper.updateByPrimaryKeySelective(taoti);
		taotiquestionMapper.deleteByPrimaryKey(key );
		
	}

}
