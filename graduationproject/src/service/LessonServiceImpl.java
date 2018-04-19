package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.LessonMapper;
import po.Lesson;
import po.Pagination;

@Service
public class LessonServiceImpl implements LessonService{
	
	@Autowired
	private LessonMapper lessonMapper;

	@Override
	public List<Lesson> getList() {
		return lessonMapper.selectByExample(null);
	}

	@Override
	public List<Lesson> getListByLimit(Pagination pagination) {
		
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return lessonMapper.getLessonListByLimit(pagination);
	}

	@Override
	public int addOne(Lesson lesson) {
		
		return lessonMapper.insertSelective(lesson);
	}

	@Override
	public void deleteLessonById(int id) {
		lessonMapper.deleteByPrimaryKey(id);
		
	}

}
