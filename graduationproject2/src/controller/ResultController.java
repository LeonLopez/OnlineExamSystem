package controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Answerresult;
import po.Examination;
import po.Pagination;
import po.Questions;
import po.Student;
import service.AnswerresultService;
import service.ExaminationService;
import service.QuestionService;
import service.ResultService;
import vo.AnswerDetailVo;
import vo.ExamListVo;
import vo.ResultListVo;
import vo.ScoreAnalysis;
import vo.TaotiQuestionsVo;

@Controller
public class ResultController {

	@Autowired
	private ResultService resultService;
	
	@Autowired
	private AnswerresultService answerresultService;
	
	@Autowired
	private ExaminationService examinationService;
	
	@Autowired
	private QuestionService questionService;
	
	@RequestMapping("/managerGetQueryResult.action")
	public @ResponseBody Map<String,Object> getExamList(Pagination pagination,ResultListVo rlv,HttpServletRequest request) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		System.out.println("***************"+rlv.getOrder());
		
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<ResultListVo> list = resultService.getResultList(managerId,rlv);
		List<ResultListVo> list2 = resultService.getResultListByLimit(pagination,managerId,rlv);

 		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerSaveExcel.action")
	public void managerSaveExcel(HttpSession session,HttpServletResponse response,ResultListVo rlv) throws Exception{
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<ResultListVo> list = resultService.getResultList(managerId,rlv);
		Workbook workbook=new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("学生考试成绩单");
		Row row=sheet.createRow(0);
		Cell cell00=row.createCell(0);
		cell00.setCellValue("姓名");
		Cell cell01=row.createCell(1);
		cell01.setCellValue("专业");
		Cell cell02=row.createCell(2);
		cell02.setCellValue("班别");
		Cell cell03=row.createCell(3);
		cell03.setCellValue("考试名称");
		Cell cell04=row.createCell(4);
		cell04.setCellValue("单选题得分");
		Cell cell05=row.createCell(5);
		cell05.setCellValue("多选题得分");
		Cell cell06=row.createCell(6);
		cell06.setCellValue("总分");
		Cell cell07=row.createCell(7);
		cell07.setCellValue("及格");
		Cell cell08=row.createCell(8);
		cell08.setCellValue("考试时间");
		for (int i = 0; i < list.size(); i++) {
			ResultListVo resultListVo = list.get(i);
			row=sheet.createRow(i+1);
			Cell cell0=row.createCell(0);
			cell0.setCellValue(resultListVo.getSname());
			Cell cell1=row.createCell(1);
			cell1.setCellValue(resultListVo.getProfession());
			Cell cell2=row.createCell(2);
			cell2.setCellValue(resultListVo.getClazz());
			Cell cell3=row.createCell(3);
			cell3.setCellValue(resultListVo.getExamname());
			Cell cell4=row.createCell(4);
			cell4.setCellValue(resultListVo.getResingle());
			Cell cell5=row.createCell(5);
			cell5.setCellValue(resultListVo.getResmore());
			Cell cell6=row.createCell(6);
			cell6.setCellValue(resultListVo.getRestotal());
			Cell cell7=row.createCell(7);
			cell7.setCellValue(resultListVo.getIspass());
			Cell cell8=row.createCell(8);
			cell8.setCellValue(resultListVo.getCreatetime());
			//获取单元格样式
			CreationHelper creationHelper = workbook.getCreationHelper();
			CellStyle cellStyle = workbook.createCellStyle();
			//定义单元格日期样式
			cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-mm-dd hh:mm:ss"));
			//设置单元格样式
			cell8.setCellStyle(cellStyle);
		}
		
		resultService.export(response, workbook, "StuExamResults.xls");
	}
	
	
	
	@RequestMapping("/managerStatisticAnalysis.action")
	public  String statisticAnalysis(ResultListVo rlv,HttpServletRequest request,Integer medium,Integer good,Integer excellent) throws Exception{
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<ResultListVo> list = resultService.getResultList(managerId,rlv);
		
		if(list!=null && list.size()!=0){
			ScoreAnalysis scoreAnalysis = new ScoreAnalysis();
			scoreAnalysis.setTotalNum(list.size());
			scoreAnalysis.setTopScore(list.get(0).getRestotal());
			scoreAnalysis.setLowScore(list.get(list.size()-1).getRestotal());
			int notpassNum = 0;
			int passNum = 0;
			int mediumNum = 0;
			int goodNum = 0;
			int excellentNum = 0;
			int totalScore = 0;
			double passRate = 0;
			double averageScore = 0;
			for(ResultListVo result:list){
				if(result.getIspass().equals("否")){
					++notpassNum;
				}else{
					++passNum;
					if(result.getRestotal()>=excellent){
						++excellentNum;
					}else if(result.getRestotal()>=good){
						++goodNum;
					}else if(result.getRestotal()>=medium){
						++mediumNum;
					}
				}
				totalScore+=result.getRestotal();
			}
			averageScore = (double)totalScore/list.size();
			passRate = (double)passNum/list.size()*100;
			DecimalFormat df = new DecimalFormat("0.0");
			String passRateStr = df.format(passRate);
			scoreAnalysis.setAverageScore(averageScore);
			scoreAnalysis.setExcellentNum(excellentNum);
			scoreAnalysis.setGoodNum(goodNum);
			scoreAnalysis.setMediumNum(mediumNum);
			scoreAnalysis.setNotpassNum(notpassNum);
			scoreAnalysis.setPassNum(passNum-excellentNum-goodNum-mediumNum);
			scoreAnalysis.setPassRate(passRateStr);
			request.setAttribute("examname", rlv.getExamname());
			request.setAttribute("scoreAnalysis", scoreAnalysis);
		}
		return "forward:/jsp/managerScoreAnalysis.jsp";
	}
	
	@RequestMapping("/getQueryResult.action")
	public String getResultList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> scoreList = resultService.getStuResultList(studentId);
        request.setAttribute("scoreList", scoreList);
		return "forward:/jsp/scoreList.jsp";
	}
	
	@RequestMapping("/getFinalResult.action")
	public String getFinalList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> scoreList = resultService.getFinalResultList(studentId);
        request.setAttribute("scoreList", scoreList);
		return "forward:/jsp/finalScoreList.jsp";
	}
	
	@RequestMapping("/getAnswerDetail.action")
	public String getAnswerDetail(Integer id,String examname,HttpServletRequest request){
		List<AnswerDetailVo> answerDetailVoList = answerresultService.getAnswerDetailListByResultId(id);
		if (answerDetailVoList != null) {
			request.setAttribute("totalQuestions", answerDetailVoList.size());// 总题数
			List<AnswerDetailVo> singleList = new ArrayList<AnswerDetailVo>();
			List<AnswerDetailVo> multiList = new ArrayList<AnswerDetailVo>();
			List<AnswerDetailVo> judgeList = new ArrayList<AnswerDetailVo>();
			for (AnswerDetailVo answerDetailVo : answerDetailVoList) {
				if (answerDetailVo.getType().equals("单选")) {
					singleList.add(answerDetailVo);
				} else if (answerDetailVo.getType().equals("多选")) {
					multiList.add(answerDetailVo);
				}else if (answerDetailVo.getType().equals("判断")) {
					judgeList.add(answerDetailVo);
				}
			}
			request.setAttribute("singleList", singleList);// 单选列表
			request.setAttribute("multiList", multiList);// 多选列表
			request.setAttribute("judgeList", judgeList);// 判断列表
			if (singleList != null) {
				request.setAttribute("singleQuestions", singleList.size());// 单选总数

				int singleScore = 0;
				for (AnswerDetailVo answerDetailVo : singleList) {
					singleScore += answerDetailVo.getScore();

				}
				request.setAttribute("singleScore", singleScore);// 单选总分数
			}
			if (multiList != null) {
				request.setAttribute("multiQuestions", multiList.size());// 多选总数
				int multiScore = 0;
				for (AnswerDetailVo answerDetailVo : multiList) {
					multiScore += answerDetailVo.getScore();
				}
				request.setAttribute("multiScore", multiScore);// 多选总分数
			}
			if (judgeList != null) {
				request.setAttribute("judgeQuestions", judgeList.size());// 判断题数
				int judgeScore = 0;
				for (AnswerDetailVo answerDetailVo : judgeList) {
					judgeScore += answerDetailVo.getScore();
				}
				request.setAttribute("judgeScore", judgeScore);// 判断总分数
			}
		}
		request.setAttribute("examname", examname);
		return "forward:/jsp/answerDetail.jsp";
	}
	
	@RequestMapping("/lookAnswer.action")
	public String lookAnswer(Integer id, HttpServletRequest request) throws Exception {
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
		return "forward:/jsp/lookanswer.jsp";
	}

	
	@RequestMapping("/saveExcel.action")
	public void saveExcel(HttpSession session,HttpServletResponse response) throws Exception{
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> list = resultService.getFinalResultList(studentId);
		Workbook workbook=new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("您的考试成绩单");
		Row row=sheet.createRow(0);
		Cell cell00=row.createCell(0);
		cell00.setCellValue("考试名称");
		Cell cell01=row.createCell(1);
		cell01.setCellValue("单选题成绩");
		Cell cell02=row.createCell(2);
		cell02.setCellValue("多选题成绩");
		Cell cell03=row.createCell(3);
		cell03.setCellValue("判断题成绩");
		Cell cell04=row.createCell(4);
		cell04.setCellValue("总成绩");
		Cell cell05=row.createCell(5);
		cell05.setCellValue("及格");
		Cell cell06=row.createCell(6);
		cell06.setCellValue("考试时间");
		for (int i = 0; i < list.size(); i++) {
			ResultListVo resultListVo = list.get(i);
			row=sheet.createRow(i+1);
			Cell cell0=row.createCell(0);
			cell0.setCellValue(resultListVo.getExamname());
			Cell cell1=row.createCell(1);
			cell1.setCellValue(resultListVo.getResingle());
			Cell cell2=row.createCell(2);
			cell2.setCellValue(resultListVo.getResmore());
			Cell cell3=row.createCell(3);
			cell3.setCellValue(resultListVo.getRestorf());
			Cell cell4=row.createCell(4);
			cell4.setCellValue(resultListVo.getRestotal());
			Cell cell5=row.createCell(5);
			cell5.setCellValue(resultListVo.getIspass());
			Cell cell6=row.createCell(6);
			cell6.setCellValue(resultListVo.getCreatetime());
			//获取单元格样式
			CreationHelper creationHelper = workbook.getCreationHelper();
			CellStyle cellStyle = workbook.createCellStyle();
			//定义单元格日期样式
			cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-mm-dd hh:mm:ss"));
			//设置单元格样式
			cell6.setCellStyle(cellStyle);
		}
		
		resultService.export(response, workbook, "examResults.xls");
	}
	
	
	
	
}
