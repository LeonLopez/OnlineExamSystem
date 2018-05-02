package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Pagination;
import po.Questions;
import service.QuestionService;
import vo.QuestionsListVo;
import vo.QuestionsQueryVo;

@Controller
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("/managerGetQuestionsList.action")
	public @ResponseBody Map<String,Object> getQuestionsList(Pagination pagination) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		List<QuestionsListVo> list = questionService.getQuestionsList();
		List<QuestionsListVo> list2 = questionService.getQuestionsListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	//返回某课程的满足搜索条件的题目
	@RequestMapping("/managerGetQuestionsListByLessonId.action")
	public @ResponseBody Map<String,Object> getQuestionsListByLessonId(QuestionsQueryVo qqv) throws Exception{
		System.out.println("**********************************************");
		System.out.println(qqv.getLessonid());
		System.out.println("**********************************************");
		Map<String,Object> map = new HashMap<String,Object>();
		List<QuestionsListVo> list = questionService.getQuestionsListByLessonId(qqv);
		map.put("rows", list);
		return map;
	}
	
	@RequestMapping("/managerAddQuestion.action")
	public @ResponseBody String addQuestion(Questions question,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		question.setCreatetime(new Date());
		question.setMid(managerId);
		int i = questionService.addQuestion(question);
		if(i>0){
			return "success";
		}
		else{
			return "";
		}
	}
	
	@RequestMapping("/managerUpdateQuestion.action")
	public @ResponseBody String updateQuestion(Questions question) throws Exception{
		
		int i = questionService.updateQuestion(question);
		if(i>0){
			return "success";
		}
		else{
			return "";
		}
	}
	
	@RequestMapping("/managerDeleteQuestion.action")
	public @ResponseBody String managerDeleteQuestion(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			questionService.deleteQuestionById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	
	
}
