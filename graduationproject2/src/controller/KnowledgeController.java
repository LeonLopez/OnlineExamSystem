package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Knowledge;
import service.KnowledgeService;

@Controller
public class KnowledgeController {
	
	@Autowired
	private KnowledgeService knowledgeService;
	
	@RequestMapping("/managerGetKnowledge.action")
	public @ResponseBody List<Knowledge> getKnowledgeList(Integer id) throws Exception{
		return knowledgeService.getKnowledgeList(id);
	}

}
