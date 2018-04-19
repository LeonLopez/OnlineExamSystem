package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Lesson;
import po.Pagination;
import service.LessonService;

@Controller
public class LessonController {

	@Autowired
	private LessonService lessonService;
	
	@RequestMapping("/managerGetLessonList.action")
	public @ResponseBody Map<String, Object> managerGetLessonList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Lesson> list=lessonService.getList();
		List<Lesson> list2=lessonService.getListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerGetLesson.action")
	public @ResponseBody List<Lesson> managerGetLesson() throws Exception{
		return lessonService.getList();
	}
	
	@RequestMapping("/managerAddLesson.action")
	public @ResponseBody String managerAddLesson(Lesson lesson) throws Exception{
		lesson.setCreatetime(new Date());
		int i = lessonService.addOne(lesson);
		if(i>0){
			return "success";
		}
		else return "";
	}
	
	@RequestMapping("/managerDeleteLesson.action")
	public @ResponseBody String managerDeleteLesson(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			lessonService.deleteLessonById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	
}
