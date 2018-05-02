package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.QuestionsMapper;
import mapper.TaotiMapper;
import mapper.TaotiquestionMapper;
import po.Pagination;
import po.Questions;
import po.Taoti;
import po.Taotiquestion;
import vo.TaotiListVo;

@Service
public class TaotiServiceImpl implements TaotiService{

	@Autowired
	private TaotiMapper taotiMapper;
	
	@Autowired
	private TaotiquestionMapper taotiquestionMapper;
	
	@Autowired
	private QuestionsMapper questionsMapper;

	@Override
	public List<TaotiListVo> getList() {
		return taotiMapper.getTaotiList();
	}

	@Override
	public List<TaotiListVo> getListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return taotiMapper.getTaotiListByLimit(pagination);
	}

	@Override
	public int addTaoti(Taoti taoti) {
		return taotiMapper.insertSelective(taoti);
	}

	@Override
	public void deleteTaotiById(int id) {
		
		taotiMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Taoti getTaotiById(Integer taotiid) {
		return taotiMapper.selectByPrimaryKey(taotiid);
	}

	@Override
	@Transactional
	public void addQuestionToTaoti(int taotiid, int questionid, int score) {
		Taotiquestion taotiquestion = new Taotiquestion();
		taotiquestion.setTaotiid(taotiid);
		taotiquestion.setQuestionid(questionid);
		taotiquestion.setScore(score);
		taotiquestionMapper.insertSelective(taotiquestion);
		Questions question = questionsMapper.selectByPrimaryKey(questionid);
		Taoti taoti = taotiMapper.selectByPrimaryKey(taotiid);
		if(question.getType().equals("单选")){
			taoti.setSinglenum(taoti.getSinglenum()+1);
			taoti.setSinglescore(taoti.getSinglescore()+score);
		}
		if(question.getType().equals("多选")){
			taoti.setMultinum(taoti.getMultinum()+1);
			taoti.setMultiscore(taoti.getMultiscore()+score);
		}
		if(question.getType().equals("判断")){
			taoti.setTrueorfalsenum(taoti.getTrueorfalsenum()+1);
			taoti.setTrueorfalsescore(taoti.getTrueorfalsescore()+score);
		}
		if(question.getDifficulty().equals("简单")){
			taoti.setEasyscore(taoti.getEasyscore()+score);
		}
		if(question.getDifficulty().equals("一般")){
			taoti.setOrdinaryscore(taoti.getOrdinaryscore()+score);
		}
		if(question.getDifficulty().equals("困难")){
			taoti.setDifficultscore(taoti.getDifficultscore()+score);
		}
		taoti.setTotalscore(taoti.getTotalscore()+score);
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
	}
	
	
}
