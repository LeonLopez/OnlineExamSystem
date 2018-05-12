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
import po.Student;
import service.StudentService;
import util.MailUtils;
import vo.StuQueryVo;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/checkExits.action")
	public @ResponseBody String checkStudentExits(String name){
		System.out.println("********************existsornot");
		List<Student> list = studentService.checkStudentByName(name);
		if(list!=null && list.size()>0){
			return "success";
		}
		else
			return "failure";
	}
	
	@RequestMapping("/register.action")
	public String registerForStudent(Student student) {
		student.setActivate(0);
		student.setJointime(new Date());
		studentService.registerForStudent(student);
		try {
			MailUtils.sendMail(student.getEmail(), "这是一封激活邮件，请点击<a href='http://localhost:8080/graduationproject2/activate.action?id="+student.getId()+"'>此链接</a>激活账号！");
			System.out.println("邮件已经发送");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return "redirect:/jsp/sendMailSuccess.jsp";
	}
	
	@RequestMapping("/activate.action")
	public String activateStudent(Integer id){
		studentService.activateStudentById(id);
		return "redirect:/jsp/activate.jsp";
	}
	
	
	@RequestMapping("/login.action")
	public String studentLogin(HttpServletRequest request,Student student){
		HttpSession session = request.getSession();
		List<Student> list = studentService.checkStudent(student);
		System.out.println(student.getName());
		System.out.println(student.getPassword());
		if(list.size() >0) {
			Student student2 = list.get(0);
			session.setAttribute("studentId", student2.getId());
			session.setAttribute("studentName", student2.getName());
			return "redirect:/jsp/index.jsp";
		}else {
			request.setAttribute("message", "对不起，帐号或密码错误！");
			return "forward:/jsp/login.jsp";
		}
	}
	
	@RequestMapping("/logout.action")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/jsp/login.jsp";
	}
	
	@RequestMapping("/personalInfoEdit.action")
	public String getPersonalInfo(HttpSession session,HttpServletRequest request){
		Student student = studentService.getPersonalInfoById((Integer)session.getAttribute("studentId"));
		request.setAttribute("student", student);
		return "forward:/jsp/personal_inf_edit.jsp";
	}
	
	@RequestMapping("/updatePersonalInfo.action")
	public String updatePersonalInfo(HttpServletRequest request,Student student){
		HttpSession session = request.getSession();
		Integer stuId = (Integer) session.getAttribute("studentId");
		student.setId(stuId);
		studentService.updatePersonalInfoById(student);
		request.setAttribute("student", student);
		return "forward:/jsp/personal_inf_edit.jsp";
	}
	//获取我的学生列表
	@RequestMapping("/managerStudentGetList.action")
	public @ResponseBody Map<String,Object> getStudentList(Pagination pagination,Student student,HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<Student> list = studentService.getStudentList(managerId,student);
		List<Student> list2 = studentService.getStudentListByLimit(pagination,managerId,student);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	//获取所有学生列表
	@RequestMapping("/managerGetAllStudent.action")
	public @ResponseBody Map<String,Object> getAllStudentList(Pagination pagination,StuQueryVo stuQueryVo,HttpServletRequest request) throws Exception{
		
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		stuQueryVo.setPagination(pagination);
		Map<String,Object> map = new HashMap<String,Object>();
		List<Student> list = studentService.getAllStudentList(stuQueryVo);
		List<Student> list2 = studentService.getAllStudentListByLimit(stuQueryVo);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerAddStudent.action")
	public @ResponseBody String managerAddStudent(Student student,HttpServletRequest request) throws Exception{
		student.setJointime(new Date());
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		int i = studentService.addStudent(student,managerId);
		if(i>0){
			return "success";
		}
		else return "";
	}
	
	@RequestMapping("/managerUpdateStudent.action")
	public @ResponseBody String updateStudent(HttpServletRequest request,Student student){
		
		studentService.updatePersonalInfoById(student);
		return "success";
	}
	
	@RequestMapping("/managerDeleteStudent.action")
	public @ResponseBody String managerDeleteStudent(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			studentService.deleteStudentById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	@RequestMapping("/managerGetProfession.action")
	public @ResponseBody List<Student> getProfessions(){
		
		return studentService.getProfessions();
	}
	
	
	@RequestMapping("/managerGetClazz.action")
	public @ResponseBody List<Student> getClazzByProfession(String profession){
		return studentService.getClazzByProfession(profession);
	}
	
	@RequestMapping("/managerGetProfessionByMid.action")
	public @ResponseBody List<Student> getProfessionsByMid(HttpSession session){
		Integer managerId = (Integer) session.getAttribute("managerId");
		return studentService.getProfessionsByMid(managerId);
	}
	@RequestMapping("/managerGetClazzByProfessionAndMid.action")
	public @ResponseBody List<Student> getClazzByProfessionAndMid(String profession,HttpSession session){
		Integer managerId = (Integer) session.getAttribute("managerId");
		return studentService.getClazzByProfessionAndMid(managerId,profession);
	}
	
	@RequestMapping("/managerAddStudentToMyStuList.action")
	public @ResponseBody String addStudentToMyStuList(@RequestBody String idsStr ,HttpSession session) throws Exception{
		Integer managerId = (Integer) session.getAttribute("managerId");
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			studentService.addStudentToMyStuList(managerId,Integer.parseInt(ids[i]));
		}
		return "success";
	}
}
