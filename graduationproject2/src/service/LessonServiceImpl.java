package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.KnowledgeMapper;
import mapper.LessonMapper;
import po.Knowledge;
import po.KnowledgeExample;
import po.KnowledgeExample.Criteria;
import po.Lesson;
import po.Pagination;
import vo.LessonListVo;

@Service
public class LessonServiceImpl implements LessonService{
	
	@Autowired
	private LessonMapper lessonMapper;
	
	@Autowired
	private KnowledgeMapper knowledgeMapper;

	@Override
	public List<Lesson> getList() {
		return lessonMapper.selectByExample(null);
	}

	@Override
	public List<LessonListVo> getListByLimit(Pagination pagination) {
		List<LessonListVo> list = new ArrayList<LessonListVo>();
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		List<Lesson> lessonList = lessonMapper.getLessonListByLimit(pagination);
		if(lessonList!=null){
			for(Lesson lesson:lessonList){
				LessonListVo lessonListVo = new LessonListVo();
				lessonListVo.setCreatetime(lesson.getCreatetime());
				lessonListVo.setId(lesson.getId());
				lessonListVo.setName(lesson.getName());
				KnowledgeExample example = new KnowledgeExample();
				Criteria criteria = example.createCriteria();
				criteria.andLessonidEqualTo(lesson.getId());
				List<Knowledge> knowledgeList = knowledgeMapper.selectByExample(example);
				String knowledgepoint= "";
				if(knowledgeList!=null){
					for(Knowledge knowledge:knowledgeList){
						knowledgepoint+=knowledge.getName()+"；";
					}
				}
				
				lessonListVo.setKnowledgepoint(knowledgepoint);
				list.add(lessonListVo);
			}
		}
		
		return list;
	}

	@Override
	@Transactional
	public void addOne(LessonListVo lessonListVo) {
		Lesson lesson = new Lesson();
		lesson.setCreatetime(new Date());
		lesson.setName(lessonListVo.getName());
		lessonMapper.insertSelective(lesson);
		String knowledgepoint = lessonListVo.getKnowledgepoint();
		if(knowledgepoint!=null && knowledgepoint!=""){
			String[] knowledgepoints = knowledgepoint.split("；");
			for(int i=0;i<knowledgepoints.length;i++){
				Knowledge knowledge = new Knowledge();
				knowledge.setLessonid(lesson.getId());
				knowledge.setName(knowledgepoints[i]);
				knowledgeMapper.insertSelective(knowledge);
			}
		}
	    
		
	}

	@Override
	public void deleteLessonById(int id) {
		lessonMapper.deleteByPrimaryKey(id);
		KnowledgeExample example = new KnowledgeExample();
		Criteria criteria =  example.createCriteria();
		criteria.andLessonidEqualTo(id);
		knowledgeMapper.deleteByExample(example);
	}

	@Override
	public void updateLesson(LessonListVo lessonListVo) {
		deleteLessonById(lessonListVo.getId());
		addOne(lessonListVo);
	}

}
