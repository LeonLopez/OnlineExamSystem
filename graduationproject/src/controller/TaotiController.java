package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Lesson;
import po.Pagination;
import po.Taoti;
import service.TaotiService;
import vo.TaotiListVo;

@Controller
public class TaotiController {

	@Autowired
	private TaotiService taotiService;
	
	@RequestMapping("/managerGetTaotiList.action")
	public @ResponseBody Map<String, Object> managerGetTaotiList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<TaotiListVo> list=taotiService.getList();
		List<TaotiListVo> list2=taotiService.getListByLimit(pagination);
		
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	@RequestMapping("/managerGetTaoti.action")
	public @ResponseBody List<TaotiListVo> managerGetTaoti() throws Exception{
		return taotiService.getList();
		
	}
	
	@RequestMapping("/managerAddTaoti.action")
	public @ResponseBody String managerTaoti(Taoti taoti,HttpServletRequest request) throws Exception{
		Integer managerId = (Integer) request.getSession().getAttribute("managerId");
		taoti.setCreatetime(new Date());
		taoti.setMid(managerId);
		int i = taotiService.addTaoti(taoti);
		if(i>0){
			return "success";
		}
		else return "";
	}
	
	@RequestMapping("/managerDeleteTaoti.action")
	public @ResponseBody String managerDeleteTaoti(@RequestBody String idsStr ) throws Exception{
		String[] ids = idsStr.split(",");
		for(int i=0;i<ids.length;i++){
			taotiService.deleteTaotiById(Integer.parseInt(ids[i]));
		}
		return "success";
	}
	
}
