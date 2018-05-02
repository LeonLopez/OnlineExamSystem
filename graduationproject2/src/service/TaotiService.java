package service;

import java.util.List;

import po.Pagination;
import po.Taoti;
import vo.TaotiListVo;

public interface TaotiService {

	List<TaotiListVo> getList();

	List<TaotiListVo> getListByLimit(Pagination pagination);

	int addTaoti(Taoti taoti);

	void deleteTaotiById(int id);

	Taoti getTaotiById(Integer taotiid);

	void addQuestionToTaoti(int taotiid, int questionid, int score);

}
