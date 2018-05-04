package controller;

import java.util.ArrayList;
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

import po.Examination;
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
import vo.TaotiQuestionsVo;

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
	
	@RequestMapping("/managerPreviewTaoti.action")
	public String preview(Integer id, HttpServletRequest request) throws Exception {
			
			List<TaotiQuestionsVo> questionsList = questionService.getQuestionListByTaotiid(id);
			if (questionsList != null) {
				request.setAttribute("totalQuestions", questionsList.size());// 总题数
				List<TaotiQuestionsVo> singleList = new ArrayList<TaotiQuestionsVo>();
				List<TaotiQuestionsVo> multiList = new ArrayList<TaotiQuestionsVo>();
				List<TaotiQuestionsVo> judgeList = new ArrayList<TaotiQuestionsVo>();
				for (TaotiQuestionsVo question : questionsList) {
					if (question.getType().equals("单选")) {
						singleList.add(question);
					} else if (question.getType().equals("多选")) {
						multiList.add(question);
					} else if (question.getType().equals("判断")) {
						judgeList.add(question);
					}
				}
				request.setAttribute("singleList", singleList);// 单选列表
				request.setAttribute("multiList", multiList);// 多选列表
				request.setAttribute("judgeList", judgeList);// 判断列表
				if (singleList != null) {
					request.setAttribute("singleQuestions", singleList.size());// 单选总数

					int singleScore = 0;
					for (TaotiQuestionsVo question : singleList) {
						singleScore += question.getScore();

					}
					request.setAttribute("singleScore", singleScore);// 单选总分数
				}
				if (multiList != null) {
					request.setAttribute("multiQuestions", multiList.size());// 多选总数
					int multiScore = 0;
					for (TaotiQuestionsVo question : multiList) {
						multiScore += question.getScore();
					}
					request.setAttribute("multiScore", multiScore);// 多选总分数
				}
				if (judgeList != null) {
					request.setAttribute("judgeQuestions", judgeList.size());// 判断总数
					int judgeScore = 0;
					for (TaotiQuestionsVo question : judgeList) {
						judgeScore += question.getScore();
					}
					request.setAttribute("judgeScore", judgeScore);// 判断总分数
				}
			}

		return "forward:/jsp/managerPreviewTaoti.jsp";
	}

}
