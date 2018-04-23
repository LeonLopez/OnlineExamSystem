package controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import po.Answerresult;
import po.Examination;
import po.Lesson;
import po.Pagination;
import po.Questions;
import po.Studentresult;
import po.Taoti;
import service.AnswerresultService;
import service.ExaminationService;
import service.QuestionService;
import service.ResultService;
import service.TaotiService;
import vo.AnswerMap;
import vo.ExamListVo;

@Controller
public class ExaminationController {

	@Autowired
	private ExaminationService examinationService;

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ResultService resultService;
	@Autowired
	private TaotiService taotiService;
	
	@Autowired
	private AnswerresultService answerresultService;

	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {

		// 转换日期
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器
	}

	@RequestMapping("/managerGetExamList.action")
	public @ResponseBody Map<String, Object> getExamList(Pagination pagination) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ExamListVo> list = examinationService.getExamList();
		List<ExamListVo> list2 = examinationService.getExamListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}

	@RequestMapping("/managerAddExam.action")
	public @ResponseBody String addExam(Examination exam, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		exam.setCreatetime(new Date());
		exam.setMid(managerId);
		int i = examinationService.addExam(exam);
		if (i > 0) {
			return "success";
		} else {
			return "";
		}
	}

	@RequestMapping("/managerUpdateExam.action")
	public @ResponseBody String updateExam(Examination exam) throws Exception {

		int i = examinationService.updateExam(exam);
		if (i > 0) {
			return "success";
		} else {
			return "";
		}
	}

	@RequestMapping("/managerDeleteExam.action")
	public @ResponseBody String managerDeleteExam(@RequestBody String idsStr) throws Exception {
		String[] ids = idsStr.split(",");
		for (int i = 0; i < ids.length; i++) {
			examinationService.deleteExamById(Integer.parseInt(ids[i]));
		}
		return "success";
	}

	@RequestMapping("/getExamList.action")
	public String stuGetExamList(HttpServletRequest request) throws Exception {
		List<ExamListVo> examList = examinationService.getExamList();
		List<ExamListVo> finishExamList = new ArrayList<ExamListVo>();
		Long currentTime = (new Date()).getTime();
		System.out.println(examList.get(0).getEndtime().getTime());
		System.out.println(currentTime);
		for (int i = 0; i < examList.size(); i++) {
			if (examList.get(i).getEndtime().getTime() < currentTime) {
				finishExamList.add(examList.get(i));
				examList.remove(i);
				--i;
			}
		}

		request.setAttribute("examList", examList);
		request.setAttribute("finishExamList", finishExamList);
		return "forward:/jsp/examList.jsp";
	}

	@RequestMapping("/startExam.action")
	public String startExam(Integer id, HttpServletRequest request) throws Exception {
		Examination exam = examinationService.getExamById(id);
		if (exam != null) {
			request.setAttribute("examname", exam.getName());
			request.setAttribute("examid", exam.getId());
			request.setAttribute("duration", exam.getDuration());
			List<Questions> questionsList = questionService.getQuestionListByTaotiid(exam.getTaotiid());
			if (questionsList != null) {
				request.setAttribute("totalQuestions", questionsList.size());// 总题数
				List<Questions> singleList = new ArrayList<Questions>();
				List<Questions> multiList = new ArrayList<Questions>();
				for (Questions question : questionsList) {
					if (question.getType().equals("单选")) {
						singleList.add(question);
					} else if (question.getType().equals("多选")) {
						multiList.add(question);
					}
				}
				request.setAttribute("singleList", singleList);// 单选列表
				request.setAttribute("multiList", multiList);// 多选列表
				if (singleList != null) {
					request.setAttribute("singleQuestions", singleList.size());// 单选总数

					int singleScore = 0;
					for (Questions question : singleList) {
						singleScore += question.getScore();

					}
					request.setAttribute("singleScore", singleScore);// 单选总分数
				}
				if (multiList != null) {
					request.setAttribute("multiQuestions", multiList.size());// 多选总数
					int multiScore = 0;
					for (Questions question : multiList) {
						multiScore += question.getScore();
					}
					request.setAttribute("multiScore", multiScore);// 多选总分数
				}
			}

		}
		return "forward:/jsp/exam_start.jsp";
	}

	@RequestMapping("/postExam.action")
	public String postExam(AnswerMap answerMap,String examname,Integer examid, HttpServletRequest request) throws Exception {
		List<Answerresult> answerResultList = new ArrayList<Answerresult>();//保存回答结果集
		Map<Integer, String> map = answerMap.getAnswerMap();
		Set<Integer> keySet = map.keySet();
		Iterator<Integer> it = keySet.iterator();
		Integer singleScore = 0;
		Integer multiScore = 0;
		while (it.hasNext()) {
			Integer key = it.next();
			String answer = map.get(key);
			Questions question = questionService.getQuestionById(key);
			Answerresult answerResult = new Answerresult();
			if(answer==null || answer==""){
				answerResult.setStuanswer("无");
			}else{
				answerResult.setStuanswer(answer);
			}
			
			answerResult.setQuestionid(key);
			if (question.getAnswer().equals(answer)) {//回答正确
				answerResult.setRightorwrong("正确");
				if (question.getType().equals("单选")) {
					singleScore += question.getScore();
				} else {
					multiScore += question.getScore();
				}
			}else{                                   //回答错误
				answerResult.setRightorwrong("错误");
			}
			answerResultList.add(answerResult);
		}
		Integer totalScore = singleScore + multiScore;//总得分
		HttpSession session = request.getSession();
		Integer sid = (Integer) session.getAttribute("studentId");
		Examination exam = examinationService.getExamById(examid);
		
		
		Studentresult result = new Studentresult(sid,singleScore,multiScore,totalScore,new Date(),examid);
		if(exam.getPassscore()<=totalScore){
			result.setIspass("是");
		}else{
			result.setIspass("否");
		}
		resultService.addStudentresult(result);
		for(Answerresult answerresult:answerResultList){
			answerresult.setSturesultid(result.getId());//设置resultid
			answerresultService.addAnswerresult(answerresult);
		}
		Taoti taoti = taotiService.getTaotiById(exam.getTaotiid());
		Integer fullMark = taoti.getTotalscore();//试卷满分分值
		double accuracy = (double)totalScore/fullMark*100;
		DecimalFormat df = new DecimalFormat("0.0");
		String accuracyFormat = df.format(accuracy);//准确率
		request.setAttribute("accuracy", accuracyFormat);
		request.setAttribute("examname", examname);
		request.setAttribute("examid", examid);
		request.setAttribute("singleScore", singleScore);
		request.setAttribute("multiScore", multiScore);
		request.setAttribute("totalScore", totalScore);
		return "forward:/jsp/examResults.jsp";
	}
}
