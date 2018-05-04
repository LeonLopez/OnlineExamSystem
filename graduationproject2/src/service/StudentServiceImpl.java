package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.ManagerstudentMapper;
import mapper.StudentMapper;
import po.ManagerstudentExample;
import po.ManagerstudentKey;
import po.Pagination;
import po.Student;
import po.StudentExample;
import po.StudentExample.Criteria;
import vo.StuQueryVo;
import vo.StudentListVo;
@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper studentMapper;
	
	@Autowired
	private ManagerstudentMapper managerStudentMapper;


	

	@Override
	public List<Student> getStudentList(Integer managerId, Student student) {
		StudentListVo stuListVo = new StudentListVo(student,managerId);
		return studentMapper.getStudentList(stuListVo);
	}

	@Override
	public List<Student> getStudentListByLimit(Pagination pagination, Integer managerId, Student student) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		StudentListVo stuListVo = new StudentListVo(student,managerId,pagination);
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

	@Override
	public Student getPersonalInfoById(Integer id) {
		return studentMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updatePersonalInfoById(Student student) {
		studentMapper.updateByPrimaryKeySelective(student);
		
	}
     //所有学生列表的专业班别
	@Override
	public List<Student> getProfessions() {
		return studentMapper.getProfessions();
	}

	@Override
	public List<Student> getClazzByProfession(String profession) {
		return studentMapper.getClazzByProfession(profession);
	}
	 //我的学生列表的专业班别
	@Override
	public List<Student> getProfessionsByMid(Integer managerId) {
		return studentMapper.getProfessionsByMid(managerId);
	}

	@Override
	public List<Student> getClazzByProfessionAndMid(Integer managerId, String profession) {
		return studentMapper.getClazzByProfessionAndMid(managerId,profession);
	}

	
	@Override
	public List<Student> getAllStudentList(StuQueryVo stuQueryVo) {
		return studentMapper.getAllStudentList(stuQueryVo);
	}

	@Override
	public List<Student> getAllStudentListByLimit(StuQueryVo stuQueryVo) {
		return studentMapper.getAllStudentListByLimit(stuQueryVo);
	}

	@Override
	public void addStudentToMyStuList(Integer managerId, int studentid) {
		ManagerstudentExample msexample = new ManagerstudentExample();
		msexample.createCriteria().andMidEqualTo(managerId).andSidEqualTo(studentid);
		
		List<ManagerstudentKey> list = managerStudentMapper.selectByExample(msexample);
		if(list==null || list.size()==0){
			ManagerstudentKey msk = new ManagerstudentKey();
			msk.setSid(studentid);
			msk.setMid(managerId);
			managerStudentMapper.insert(msk);
		}
		
		
	}


	
}
