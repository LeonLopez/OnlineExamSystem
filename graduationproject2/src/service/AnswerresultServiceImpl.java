package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.AnswerresultMapper;
import po.Answerresult;
import vo.AnswerDetailVo;


@Service
public class AnswerresultServiceImpl implements AnswerresultService{
	
	@Autowired
	private AnswerresultMapper answerresultMapper;
	

	@Override
	public List<AnswerDetailVo> getAnswerDetailListByResultId(Integer id) {
		return answerresultMapper.getAnswerDetailListByResultId(id);
	}


	@Override
	public void addAnswerresult(Answerresult answerresult) {
		
		answerresultMapper.insertSelective(answerresult);
		
	}

}
