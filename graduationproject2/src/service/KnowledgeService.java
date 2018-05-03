package service;

import java.util.List;

import po.Knowledge;
import vo.KnowledgeDetailVo;

public interface KnowledgeService {

	List<Knowledge> getKnowledgeList(Integer id);

	List<Knowledge> getKnowledgesByTaotiid(Integer taotiid);


}
