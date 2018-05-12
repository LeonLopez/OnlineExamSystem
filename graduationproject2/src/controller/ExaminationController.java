package controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
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
import po.Student;
import po.Studentresult;
import po.Taoti;
import service.AnswerresultService;
import service.ExaminationService;
import service.ExamtimesService;
import service.QuestionService;
import service.ResultService;
import service.TaotiService;
import vo.AnswerMap;
import vo.ExamListVo;
import vo.ExamnameVo;
import vo.TaotiQuestionsVo;

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
	
	@Autowired
	private ExamtimesService examtimesService;

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
	
	@RequestMapping("/managerGetExamination.action")
	public @ResponseBody List<ExamnameVo> getExaminations(){
		
		return examinationService.getExaminations();
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
		if(examList!=null && examList.size()>0){
			for (int i = 0; i < examList.size(); i++) {
				if (examList.get(i).getEndtime().getTime() < currentTime) {
					finishExamList.add(examList.get(i));
					examList.remove(i);
					--i;
				}
			}
		}
		

		request.setAttribute("examList", examList);
		request.setAttribute("finishExamList", finishExamList);
		return "forward:/jsp/examList.jsp";
	}

	@RequestMapping("/beforeAnswer.action")
	public String beforeAnswer(Integer id,String name, HttpServletRequest request) throws Exception {
		System.out.println("执行beforeanswer***************************");
		Integer studentId = (Integer) request.getSession().getAttribute("studentId");
	    int times = examtimesService.getExamtimesBySid(studentId,id);
	    System.out.println(times+"*****************************times");
	    request.setAttribute("id", id);
	    request.setAttribute("name", name);
	    request.setAttribute("examtimes", times);
		return "forward:/jsp/beforeAnswer.jsp";
	}
	
	@RequestMapping("/startExam.action")
	public String startExam(Integer id, HttpServletRequest request) throws Exception {
		//考试次数记录
		Integer studentId = (Integer) request.getSession().getAttribute("studentId");
	    examtimesService.updateExamtimesBySid(studentId,id);
	    
	    
		Examination exam = examinationService.getExamById(id);
		if (exam != null) {
			request.setAttribute("examname", exam.getName());
			request.setAttribute("examid", exam.getId());
			request.setAttribute("duration", exam.getDuration());
			List<TaotiQuestionsVo> questionsList = questionService.getQuestionListByTaotiid(exam.getTaotiid());
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
				//打乱试题
				Collections.shuffle(singleList);
				Collections.shuffle(multiList);
				Collections.shuffle(judgeList);
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

		}
		return "forward:/jsp/exam_start.jsp";
	}

	@RequestMapping("/postExam.action")
	public String postExam(AnswerMap answerMap, String examname, Integer examid, HttpServletRequest request)
			throws Exception {

		Examination exam = examinationService.getExamById(examid);
		int taotiid = exam.getTaotiid();
		List<TaotiQuestionsVo> questionsList = questionService.getQuestionListByTaotiid(exam.getTaotiid());// taoti中的全部问题
		List<Answerresult> answerResultList = new ArrayList<Answerresult>();// 保存回答结果集
		Map<Integer, String> map = answerMap.getAnswerMap();
		Set<Integer> keySet = map.keySet();
		System.out.println("keyNum" + keySet.size());
		Iterator<Integer> it = keySet.iterator();
		Integer singleScore = 0;
		Integer multiScore = 0;
		Integer judgeScore = 0;
		while (it.hasNext()) {
			Integer key = it.next();
			String answer = map.get(key);
			TaotiQuestionsVo question = questionService.getTaotiQuestionByTaotiQuestionIds(taotiid, key);// 获取相应的题目和分数
			Answerresult answerResult = new Answerresult();
			if (answer == null || answer == "") {
				answerResult.setStuanswer("无");
			} else {
				answerResult.setStuanswer(answer);
			}

			answerResult.setQuestionid(key);
			if (!question.getType().equals("判断")) {
				if (question.getAnswer().equals(answer)) {// 回答正确
					answerResult.setRightorwrong("正确");
					if (question.getType().equals("单选")) {
						singleScore += question.getScore();
					} else {
						multiScore += question.getScore();
					}
				} else { // 回答错误
					answerResult.setRightorwrong("错误");
				}

			} else {// 为判断题
				if (question.getJudgeanswer().equals(answer)) {
					answerResult.setRightorwrong("正确");
					judgeScore += question.getScore();
				} else {
					answerResult.setRightorwrong("错误");
				}
			}

			answerResultList.add(answerResult);
			// 从全部问题中去掉有答案的题目，筛选剩下没有答案的题目待会再处理
			for (TaotiQuestionsVo q : questionsList) {
				if (q.getId() == key) {
					questionsList.remove(q);
					break;
				}
			}
		}
		Integer totalScore = singleScore + multiScore + judgeScore;// 总得分
		HttpSession session = request.getSession();
		Integer sid = (Integer) session.getAttribute("studentId");

		Studentresult result = new Studentresult(sid, singleScore, multiScore, judgeScore, totalScore, new Date(),
				examid);
		if (exam.getPassscore() <= totalScore) {
			result.setIspass("是");
		} else {
			result.setIspass("否");
		}
		resultService.addStudentresult(result);
		for (Answerresult answerresult : answerResultList) {
			answerresult.setSturesultid(result.getId());// 设置resultid
			answerresultService.addAnswerresult(answerresult);
		}

		// 设置未回答题目的回答情况
		if (questionsList != null && questionsList.size() > 0) {
			for (TaotiQuestionsVo quest : questionsList) {
				Answerresult ar = new Answerresult();
				ar.setSturesultid(result.getId());
				ar.setQuestionid(quest.getId());
				ar.setStuanswer("无");
				ar.setRightorwrong("错误");
				answerresultService.addAnswerresult(ar);
			}
		}
		Taoti taoti = taotiService.getTaotiById(exam.getTaotiid());
		Integer fullMark = taoti.getTotalscore();// 试卷满分分值
		double accuracy = (double) totalScore / fullMark * 100;
		DecimalFormat df = new DecimalFormat("0.0");
		String accuracyFormat = df.format(accuracy);// 准确率
		request.setAttribute("accuracy", accuracyFormat);
		request.setAttribute("examname", examname);
		request.setAttribute("examid", examid);
		request.setAttribute("singleScore", singleScore);
		request.setAttribute("multiScore", multiScore);
		request.setAttribute("judgeScore", judgeScore);
		request.setAttribute("totalScore", totalScore);
		return "forward:/jsp/examResults.jsp";
	}

	@RequestMapping("/startPractice.action")
	public String startPractice(Integer id, HttpServletRequest request) throws Exception {
		Examination exam = examinationService.getExamById(id);
		if (exam != null) {
			request.setAttribute("examname", exam.getName());
			request.setAttribute("examid", exam.getId());
			request.setAttribute("duration", exam.getDuration());
			List<TaotiQuestionsVo> questionsList = questionService.getQuestionListByTaotiid(exam.getTaotiid());
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

		}
		return "forward:/jsp/practice_start.jsp";
	}

	@RequestMapping(value={"/postPractice.action"})
	public String postPractice(AnswerMap answerMap, String examname, Integer examid, HttpServletRequest request)
			throws Exception {

		Examination exam = examinationService.getExamById(examid);
		int taotiid = exam.getTaotiid();
		List<Answerresult> answerResultList = new ArrayList<Answerresult>();// 保存回答结果集
		Map<Integer, String> map = answerMap.getAnswerMap();
		Set<Integer> keySet = map.keySet();
		System.out.println("keyNum" + keySet.size());
		Iterator<Integer> it = keySet.iterator();
		Integer singleScore = 0;
		Integer multiScore = 0;
		Integer judgeScore = 0;
		while (it.hasNext()) {
			Integer key = it.next();
			String answer = map.get(key);
			TaotiQuestionsVo question = questionService.getTaotiQuestionByTaotiQuestionIds(taotiid, key);// 获取相应的题目和分数

			if (!question.getType().equals("判断")) {
				if (question.getAnswer().equals(answer)) {// 回答正确
					if (question.getType().equals("单选")) {
						singleScore += question.getScore();
					} else {
						multiScore += question.getScore();
					}
				}
			} else {// 为判断题
				if (question.getJudgeanswer().equals(answer)) {
					judgeScore += question.getScore();
				}
			}
		}
		Integer totalScore = singleScore + multiScore + judgeScore;// 总得分

		Taoti taoti = taotiService.getTaotiById(exam.getTaotiid());
		Integer fullMark = taoti.getTotalscore();// 试卷满分分值
		double accuracy = (double) totalScore / fullMark * 100;
		DecimalFormat df = new DecimalFormat("0.0");
		String accuracyFormat = df.format(accuracy);// 准确率
		request.setAttribute("accuracy", accuracyFormat);
		request.setAttribute("examname", examname);
		request.setAttribute("examid", examid);
		request.setAttribute("singleScore", singleScore);
		request.setAttribute("multiScore", multiScore);
		request.setAttribute("judgeScore", judgeScore);
		request.setAttribute("totalScore", totalScore);
		return "forward:/jsp/practiceResults.jsp";
	}
	
	@RequestMapping("/managerTryExam.action")
	public String tryExam(Integer id, HttpServletRequest request) throws Exception {
		Examination exam = examinationService.getExamById(id);
		if (exam != null) {
			request.setAttribute("examname", exam.getName());
			request.setAttribute("examid", exam.getId());
			request.setAttribute("duration", exam.getDuration());
			List<TaotiQuestionsVo> questionsList = questionService.getQuestionListByTaotiid(exam.getTaotiid());
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

		}
		return "forward:/jsp/managerTryExam.jsp";
	}
	
	@RequestMapping(value={"/managerPostExam.action"})
	public String managerpostPractice(AnswerMap answerMap, String examname, Integer examid, HttpServletRequest request)
			throws Exception {

		Examination exam = examinationService.getExamById(examid);
		int taotiid = exam.getTaotiid();
		List<Answerresult> answerResultList = new ArrayList<Answerresult>();// 保存回答结果集
		Map<Integer, String> map = answerMap.getAnswerMap();
		Set<Integer> keySet = map.keySet();
		System.out.println("keyNum" + keySet.size());
		Iterator<Integer> it = keySet.iterator();
		Integer singleScore = 0;
		Integer multiScore = 0;
		Integer judgeScore = 0;
		while (it.hasNext()) {
			Integer key = it.next();
			String answer = map.get(key);
			TaotiQuestionsVo question = questionService.getTaotiQuestionByTaotiQuestionIds(taotiid, key);// 获取相应的题目和分数

			if (!question.getType().equals("判断")) {
				if (question.getAnswer().equals(answer)) {// 回答正确
					if (question.getType().equals("单选")) {
						singleScore += question.getScore();
					} else {
						multiScore += question.getScore();
					}
				}
			} else {// 为判断题
				if (question.getJudgeanswer().equals(answer)) {
					judgeScore += question.getScore();
				}
			}
		}
		Integer totalScore = singleScore + multiScore + judgeScore;// 总得分

		Taoti taoti = taotiService.getTaotiById(exam.getTaotiid());
		Integer fullMark = taoti.getTotalscore();// 试卷满分分值
		double accuracy = (double) totalScore / fullMark * 100;
		DecimalFormat df = new DecimalFormat("0.0");
		String accuracyFormat = df.format(accuracy);// 准确率
		request.setAttribute("accuracy", accuracyFormat);
		request.setAttribute("examname", examname);
		request.setAttribute("examid", examid);
		request.setAttribute("singleScore", singleScore);
		request.setAttribute("multiScore", multiScore);
		request.setAttribute("judgeScore", judgeScore);
		request.setAttribute("totalScore", totalScore);
		return "forward:/jsp/managerTryExamResult.jsp";
	}
}
