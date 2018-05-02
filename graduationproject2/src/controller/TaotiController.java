package controller;

import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Lesson;
import po.Pagination;
import po.Questions;
import po.Taoti;
import po.Taotiquestion;
import service.QuestionService;
import service.TaotiService;
import service.TaotiquestionService;
import vo.AutoMakeTaotiVo;
import vo.TaotiListVo;

@Controller
public class TaotiController {

	@Autowired
	private TaotiService taotiService;
	@Autowired
	private TaotiquestionService taotiquestionService;
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("/managerGetTaotiList.action")
	public @ResponseBody Map<String, Object> managerGetTaotiList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<TaotiListVo> list=taotiService.getList();
		List<TaotiListVo> list2=taotiService.getListByLimit(pagination);
		
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	@RequestMapping("/managerGetTaoti.action")
	public @ResponseBody List<TaotiListVo> managerGetTaoti() throws Exception{
		return taotiService.getList();
		
	}
	
	@RequestMapping("/managerAddTaoti.action")
	public @ResponseBody String managerTaoti(Taoti taoti,HttpServletRequest request) throws Exception{
		Integer managerId = (Integer) request.getSession().getAttribute("managerId");
		taoti.setCreatetime(new Date());
		taoti.setMid(managerId);
		taoti.setSinglenum(0);
		taoti.setSinglescore(0);
		taoti.setMultinum(0);
		taoti.setMultiscore(0);
		taoti.setTrueorfalsenum(0);
		taoti.setTrueorfalsescore(0);
		taoti.setEasyscore(0);
		taoti.setOrdinaryscore(0);
		taoti.setDifficultscore(0);
		taoti.setTotalscore(0);
		taoti.setDifficultylevel("简单");
		int i = taotiService.addTaoti(taoti);
		if(i>0){
			return "success";
		}
		else return "";
	}
	
	@RequestMapping("/managerDeleteTaoti.action")
	public @ResponseBody String managerDeleteTaoti(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			taotiService.deleteTaotiById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	//人工组卷
	@RequestMapping("/managerAddQuestionsToTaoti.action")
	public @ResponseBody String addQuestionsToTaoti(@RequestBody String idsStr,int score,int taotiid ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			int questionid = Integer.parseInt(ids[i]);
			List<Taotiquestion> taotiquestionList = taotiquestionService.getTaotiQuestion(taotiid,questionid);
			if(taotiquestionList==null || taotiquestionList.size()==0){
				taotiService.addQuestionToTaoti(taotiid,questionid,score);
			}
		}
		return "success";
	}
	//自动组卷
	@RequestMapping("/managerAutoAddQuestionsToTaoti.action")
	public @ResponseBody String autoAddQuestionsToTaoti(AutoMakeTaotiVo amtv) throws Exception{
	
		List<Questions> questionsList = questionService.getQuestionListByAutoMakeTaotiVo(amtv);
		
		
		if(questionsList.size()<amtv.getQuestionNum().intValue()){
			return String.valueOf(questionsList.size());
		}
		Collections.shuffle(questionsList);
		System.out.println("******************************");
	    for(Questions question:questionsList){
	    	System.out.print(question.getId()+" ");
	    }
		System.out.println("******************************");
		int taotiid = amtv.getTaotiid();
		int score = amtv.getScore();
		int count = 0;
		for(Questions question:questionsList){
			List<Taotiquestion> taotiquestionList = taotiquestionService.getTaotiQuestion(taotiid,question.getId());
			if(taotiquestionList==null || taotiquestionList.size()==0){
				taotiService.addQuestionToTaoti(taotiid,question.getId(),score);
				count++;
				if(count==amtv.getQuestionNum()){
					break;
				}
			}
		}
		return "success";
	}
	
	
}
