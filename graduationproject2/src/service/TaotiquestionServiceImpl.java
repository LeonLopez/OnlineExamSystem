package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.TaotiquestionMapper;
import po.Taotiquestion;
import po.TaotiquestionExample;
import po.TaotiquestionExample.Criteria;

@Service
public class TaotiquestionServiceImpl implements TaotiquestionService {
	
	@Autowired
	private TaotiquestionMapper taotiquestionMapper;

	@Override
	public List<Taotiquestion> getTaotiQuestion(int taotiid, int questionid) {
		TaotiquestionExample example = new TaotiquestionExample();
		Criteria criteria = example.createCriteria();
		criteria.andTaotiidEqualTo(taotiid);
		criteria.andQuestionidEqualTo(questionid);
		
		return taotiquestionMapper.selectByExample(example);
	}

}
