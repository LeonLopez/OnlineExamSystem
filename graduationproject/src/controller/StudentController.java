package controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Manager;
import po.Pagination;
import po.Student;
import service.StudentService;
import util.MailUtils;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("/checkStudentExits.action")
	public InputStream checkStudentExits(String name){
		List<Student> list = studentService.checkStudentByName(name);
		InputStream inputStream = null;
		if(list.size()>0){
			inputStream = new ByteArrayInputStream("false".getBytes());
		}else{
			inputStream = new ByteArrayInputStream("true".getBytes());
		}
		return inputStream;
	}
	@RequestMapping("/register.action")
	public String registerForStudent(Student student) {
		student.setActivate(0);
		student.setJointime(new Date());
		studentService.registerForStudent(student);
		try {
			MailUtils.sendMail(student.getEmail(), "这是一封激活邮件，请点击<a href='http://localhost:8080/graduationproject/activate.action?id="+student.getId()+"'>此链接</a>激活账号！");
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
			return "redirect:/jsp/login.jsp";
		}
	}
	
	@RequestMapping("/managerStudentGetList.action")
	public @ResponseBody Map<String,Object> getStudentList(Pagination pagination,HttpServletRequest request) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer managerId = (Integer) session.getAttribute("managerId");
		List<Student> list = studentService.getStudentList(managerId);
		List<Student> list2 = studentService.getStudentListByLimit(pagination,managerId);
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
	
	@RequestMapping("/managerDeleteStudent.action")
	public @ResponseBody String managerDeleteStudent(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			studentService.deleteStudentById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	
}
