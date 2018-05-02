package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.KnowledgeMapper;
import po.Knowledge;
import po.KnowledgeExample;
import po.KnowledgeExample.Criteria;

@Service
public class KnowledgeServiceImpl implements KnowledgeService {
	
	@Autowired
	private KnowledgeMapper knowledgeMapper;

	@Override
	public List<Knowledge> getKnowledgeList(Integer id) {
		KnowledgeExample example = new KnowledgeExample();
		Criteria criteria = example.createCriteria();
		criteria.andLessonidEqualTo(id);
		return knowledgeMapper.selectByExample(example);
	}

}
