package controller;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Knowledge;
import service.KnowledgeService;
import vo.KnowledgeDetailVo;

@Controller
public class KnowledgeController {
	
	@Autowired
	private KnowledgeService knowledgeService;
	
	@RequestMapping("/managerGetKnowledge.action")
	public @ResponseBody List<Knowledge> getKnowledgeList(Integer id) throws Exception{
		return knowledgeService.getKnowledgeList(id);
	}
	
	
	@RequestMapping("/managerGetKnowledgeDetail.action")
	public @ResponseBody KnowledgeDetailVo getKnowledgeDetail(Integer taotiid,Integer lessonid) throws Exception{
		List<Knowledge> totalKnowledges = knowledgeService.getKnowledgeList(lessonid);
		List<Knowledge> taotiKnowledges = knowledgeService.getKnowledgesByTaotiid(taotiid);
		KnowledgeDetailVo kdv = new KnowledgeDetailVo();
		//处理值为零的情况
		if(totalKnowledges.size()==0){
			kdv.setKnowledgerate("0.0");
			kdv.setKnowledgepoints("无");
			kdv.setLessonknowledgepoints("无");
			return kdv;
		}
		if(taotiKnowledges.size()==0){
			kdv.setKnowledgerate("0.0");
			kdv.setKnowledgepoints("无");
			String totalknowledgepoints="";
			for(Knowledge lessonknowledge:totalKnowledges){
				totalknowledgepoints+=lessonknowledge.getName()+"；";
			}
			kdv.setLessonknowledgepoints(totalknowledgepoints);
			return kdv;
		}
		
		//处理非零情况
		double knowledgerate = (double)taotiKnowledges.size()/totalKnowledges.size()*100;
		DecimalFormat df = new DecimalFormat("0.0");
		String knowledgerateFormat = df.format(knowledgerate);//准确率
		kdv.setKnowledgerate(knowledgerateFormat);
		String knowledgepoints = "";
		for(Knowledge knowledge:taotiKnowledges){
			knowledgepoints+=knowledge.getName()+"；";
		}
		kdv.setKnowledgepoints(knowledgepoints);
		String lessonknowledgepoints="";
		for(Knowledge lessonknowledge:totalKnowledges){
			lessonknowledgepoints+=lessonknowledge.getName()+"；";
		}
		kdv.setLessonknowledgepoints(lessonknowledgepoints);
		return kdv;
	}
	
}
