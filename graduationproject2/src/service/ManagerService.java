package service;

import java.util.List;

import po.Manager;
import po.Pagination;

public interface ManagerService {

	List<Manager> checkManager(Manager manager);

	List<Manager> getList();

	List<Manager> getListByLimit(Pagination pagination);

	void addOne(Manager manager);

	void deleteOne(Integer id);

	void updateOne(Manager manager);

}
