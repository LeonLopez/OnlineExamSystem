package controller;

import java.util.ArrayList;
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

import po.Answerresult;
import po.Pagination;
import po.Questions;
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
		}
		request.setAttribute("examname", examname);
		return "forward:/jsp/answerDetail.jsp";
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
