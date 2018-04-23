package service;

import java.util.List;

import po.Answerresult;
import vo.AnswerDetailVo;

public interface AnswerresultService {

	List<AnswerDetailVo> getAnswerDetailListByResultId(Integer id);

	void addAnswerresult(Answerresult answerresult);

	
	
}
