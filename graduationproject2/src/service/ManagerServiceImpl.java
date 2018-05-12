package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.ManagerMapper;
import po.Manager;
import po.ManagerExample;
import po.Pagination;
import po.ManagerExample.Criteria;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerMapper managerMapper;

	@Override
	public List<Manager> checkManager(Manager manager) {
		ManagerExample example = new ManagerExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(manager.getName());
		criteria.andPasswordEqualTo(manager.getPassword());
		return managerMapper.selectByExample(example);
	}
	
	public List<Manager> getList() {
		ManagerExample example=new ManagerExample();
		List<Manager> list = managerMapper.selectByExample(example);
		return list;
	}

	public List<Manager> getListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		List<Manager> list = managerMapper.getListByLimit(pagination);
		return list;
	}

	@Transactional
	public void addOne(Manager manager) {
		managerMapper.insertSelective(manager);
	}

	@Transactional
	public void deleteOne(Integer id)  {
		managerMapper.deleteByPrimaryKey(id);
	}

	public Manager findOneById(Integer id) throws Exception {
		return managerMapper.selectByPrimaryKey(id);
	}

	@Transactional
	public void updateOne(Manager manager) {
		managerMapper.updateByPrimaryKeySelective(manager);
	}



}
