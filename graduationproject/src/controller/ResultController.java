package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Pagination;
import service.ResultService;
import vo.ExamListVo;
import vo.ResultListVo;

@Controller
public class ResultController {

	@Autowired
	private ResultService resultService;
	
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
	
	@RequestMapping("/getQueryResult.action")
	public String getResultList(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Integer studentId = (Integer) session.getAttribute("studentId");
		List<ResultListVo> scoreList = resultService.getStuResultList(studentId);
        request.setAttribute("scoreList", scoreList);
		return "forward:/jsp/scoreList.jsp";
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
}
