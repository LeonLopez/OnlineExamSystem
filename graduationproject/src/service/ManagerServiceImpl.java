package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ManagerMapper;
import po.Manager;
import po.ManagerExample;
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

}
