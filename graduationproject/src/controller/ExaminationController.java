package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import po.Examination;
import po.Lesson;
import po.Pagination;
import po.Questions;
import service.ExaminationService;
import vo.ExamListVo;

@Controller
public class ExaminationController {

	@Autowired
	private ExaminationService examinationService;
	
	@InitBinder  
    public void initBinder(WebDataBinder binder, WebRequest request) {  
          
        //转换日期  
        DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));// CustomDateEditor为自定义日期编辑器  
    }  
	
	@RequestMapping("/managerGetExamList.action")
	public @ResponseBody Map<String,Object> getExamList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<ExamListVo> list = examinationService.getExamList();
		List<ExamListVo> list2 = examinationService.getExamListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerAddExam.action")
	public @ResponseBody String addExam(Examination exam,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		exam.setCreatetime(new Date());
		exam.setMid(managerId);
		int i = examinationService.addExam(exam);
		if(i>0){
			return "success";
		}
		else{
			return "";
		}
	}
	
	@RequestMapping("/managerUpdateExam.action")
	public @ResponseBody String updateExam(Examination exam) throws Exception{
		
		int i = examinationService.updateExam(exam);
		if(i>0){
			return "success";
		}
		else{
			return "";
		}
	}
	
	@RequestMapping("/managerDeleteExam.action")
	public @ResponseBody String managerDeleteExam(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			examinationService.deleteExamById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
}
