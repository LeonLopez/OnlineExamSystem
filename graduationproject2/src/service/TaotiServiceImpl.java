package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.TaotiMapper;
import po.Pagination;
import po.Taoti;
import vo.TaotiListVo;

@Service
public class TaotiServiceImpl implements TaotiService{

	@Autowired
	private TaotiMapper taotiMapper;

	@Override
	public List<TaotiListVo> getList() {
		return taotiMapper.getTaotiList();
	}

	@Override
	public List<TaotiListVo> getListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return taotiMapper.getTaotiListByLimit(pagination);
	}

	@Override
	public int addTaoti(Taoti taoti) {
		return taotiMapper.insertSelective(taoti);
	}

	@Override
	public void deleteTaotiById(int id) {
		
		taotiMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Taoti getTaotiById(Integer taotiid) {
		return taotiMapper.selectByPrimaryKey(taotiid);
	}
	
	
}
