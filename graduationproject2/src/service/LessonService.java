package service;

import java.util.List;

import po.Lesson;
import po.Pagination;
import vo.LessonListVo;

public interface LessonService {

	List<Lesson> getList();

	List<LessonListVo> getListByLimit(Pagination pagination);

	void addOne(LessonListVo lessonListVo);

	void deleteLessonById(int parseInt);

	void updateLesson(LessonListVo lessonListVo);

}
