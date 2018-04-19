package service;

import java.util.List;

import po.Lesson;
import po.Pagination;

public interface LessonService {

	List<Lesson> getList();

	List<Lesson> getListByLimit(Pagination pagination);

	int addOne(Lesson lesson);

	void deleteLessonById(int parseInt);

}
