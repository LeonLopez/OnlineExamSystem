package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.ManagerstudentMapper;
import mapper.StudentMapper;
import po.ManagerstudentKey;
import po.Pagination;
import po.Student;
import po.StudentExample;
import po.StudentExample.Criteria;
import vo.StudentListVo;
@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private ManagerstudentMapper managerStudentMapper;


	@Override
	public List<Student> getStudentList(Integer managerId) {
		return studentMapper.getStudentList(managerId);
	}

	@Override
	public List<Student> getStudentListByLimit(Pagination pagination, Integer managerId) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		StudentListVo stuListVo = new StudentListVo(pagination,managerId);
		return studentMapper.getStudentListByLimit(stuListVo);
	}

	@Override
	public void deleteStudentById(Integer id) {
		studentMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional
	public int addStudent(Student student,Integer managerId) {
		student.setJointime(new Date());
		student.setActivate(1);
		int id =  studentMapper.insertSelective(student);
		
		ManagerstudentKey msk = new ManagerstudentKey();
		msk.setSid(student.getId());
		msk.setMid(managerId);
		managerStudentMapper.insert(msk);
		return id;
	}

	@Override
	public List<Student> checkStudent(Student student) {
		    StudentExample example = new StudentExample();
			Criteria criteria = example.createCriteria();
			criteria.andNameEqualTo(student.getName());
			criteria.andPasswordEqualTo(student.getPassword());
			return studentMapper.selectByExample(example);
	}

	@Override
	public List<Student> checkStudentByName(String name) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		return studentMapper.selectByExample(example);
	}

	@Override
	public void registerForStudent(Student student) {
		studentMapper.insertSelective(student);
		
	}

	@Override
	public void activateStudentById(Integer id) {

		studentMapper.updateActivateById(id);
		
	}

}
