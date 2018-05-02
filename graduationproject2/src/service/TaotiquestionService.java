package service;

import java.util.List;

import po.Taotiquestion;

public interface TaotiquestionService  {

	List<Taotiquestion> getTaotiQuestion(int taotiid, int questionid);

}
