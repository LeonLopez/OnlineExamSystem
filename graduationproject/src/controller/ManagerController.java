package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import po.Manager;
import service.ManagerService;

@Controller
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/managerLogin.action")
	public String managerLogin(HttpServletRequest request,Manager manager){
		HttpSession session = request.getSession();
		List<Manager> list = managerService.checkManager(manager);
		if(list.size() >0) {
			Manager manager2 = list.get(0);
			session.setAttribute("managerId", manager2.getId());
			session.setAttribute("managerName", manager2.getName());
			session.setAttribute("managerAuthority", manager2.getAuthority());
			return "redirect:/jsp/managerIndex.jsp";
		}else {
			request.setAttribute("message", "对不起，帐号或密码错误！");
			return "redirect:/jsp/managerLogin.jsp";
		}
	}
}
