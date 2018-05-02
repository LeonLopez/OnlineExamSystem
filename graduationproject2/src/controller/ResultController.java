package controller;

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
import po.Pagination;
import po.Questions;
import po.Student;
import service.AnswerresultService;
import service.ResultService;
import vo.AnswerDetailVo;
import vo.ExamListVo;
import vo.ResultListVo;

@Controller
public class ResultController {

	@Autowired
	private ResultService resultService;
	
	@Autowired
	private AnswerresultService answerresultService;
	
	@RequestMapping("/managerGetQueryResult.action")
	public @ResponseBody Map<String,Object> getExamList(Pagination pagination,ResultListVo rlv,HttpServletRequest request) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		
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
	
	@RequestMapping("/managerGetProfession.action")
	public @ResponseBody List<String> getProfessionList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<String> professionList = resultService.getProfessionList(managerId);
		System.out.println(professionList);
		return professionList;
	}
	
	@RequestMapping("/managerGetClazz.action")
	public @ResponseBody List<Integer> getClazzList(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<Integer> clazzList = resultService.getClazzList(managerId);
		return clazzList;
	}
	
	@RequestMapping("/managerGetExamName.action")
	public @ResponseBody List<String> ExamName() throws Exception{
		List<String> examNameList = resultService.getExamNameList();
		return examNameList;
	}
	
	@RequestMapping("/getQueryResult.action")
	public String getResultList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> scoreList = resultService.getStuResultList(studentId);
        request.setAttribute("scoreList", scoreList);
		return "forward:/jsp/scoreList.jsp";
	}
	
	
	@RequestMapping("/getAnswerDetail.action")
	public String getAnswerDetail(Integer id,String examname,HttpServletRequest request){
		List<AnswerDetailVo> answerDetailVoList = answerresultService.getAnswerDetailListByResultId(id);
		if (answerDetailVoList != null) {
			request.setAttribute("totalQuestions", answerDetailVoList.size());// 总题数
			List<AnswerDetailVo> singleList = new ArrayList<AnswerDetailVo>();
			List<AnswerDetailVo> multiList = new ArrayList<AnswerDetailVo>();
			for (AnswerDetailVo answerDetailVo : answerDetailVoList) {
				if (answerDetailVo.getType().equals("单选")) {
					singleList.add(answerDetailVo);
				} else if (answerDetailVo.getType().equals("多选")) {
					multiList.add(answerDetailVo);
				}
			}
			request.setAttribute("singleList", singleList);// 单选列表
			request.setAttribute("multiList", multiList);// 多选列表
			if (singleList != null) {
				request.setAttribute("singleQuestions", singleList.size());// 单选总数

				int singleScore = 0;
				for (AnswerDetailVo answerDetailVo : singleList) {
					//singleScore += answerDetailVo.getScore();

				}
				request.setAttribute("singleScore", singleScore);// 单选总分数
			}
			if (multiList != null) {
				request.setAttribute("multiQuestions", multiList.size());// 多选总数
				int multiScore = 0;
				for (AnswerDetailVo answerDetailVo : multiList) {
					//multiScore += answerDetailVo.getScore();
				}
				request.setAttribute("multiScore", multiScore);// 多选总分数
			}
		}
		request.setAttribute("examname", examname);
		return "forward:/jsp/answerDetail.jsp";
	}
	
	
	@RequestMapping("/saveExcel.action")
	public void saveExcel(HttpSession session,HttpServletResponse response) throws Exception{
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> list = resultService.getStuResultList(studentId);
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
		cell03.setCellValue("总成绩");
		Cell cell04=row.createCell(4);
		cell04.setCellValue("及格");
		Cell cell05=row.createCell(5);
		cell05.setCellValue("考试时间");
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
			cell3.setCellValue(resultListVo.getRestotal());
			Cell cell4=row.createCell(4);
			cell4.setCellValue(resultListVo.getIspass());
			Cell cell5=row.createCell(5);
			cell5.setCellValue(resultListVo.getCreatetime());
			//获取单元格样式
			CreationHelper creationHelper = workbook.getCreationHelper();
			CellStyle cellStyle = workbook.createCellStyle();
			//定义单元格日期样式
			cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-mm-dd hh:mm:ss"));
			//设置单元格样式
			cell5.setCellStyle(cellStyle);
		}
		
		resultService.export(response, workbook, "examResults.xls");
	}
	
	
	
	
}
