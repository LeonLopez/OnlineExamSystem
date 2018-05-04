package service;

import java.util.List;

import po.Pagination;
import po.Student;
import vo.StuQueryVo;

public interface StudentService {

	List<Student> getStudentList(Integer managerId, Student student);

	List<Student> getStudentListByLimit(Pagination pagination, Integer managerId, Student student);

	void deleteStudentById(Integer id);

	int addStudent(Student student, Integer managerId);

	List<Student> checkStudent(Student student);

	List<Student> checkStudentByName(String name);

	void registerForStudent(Student student);

	void activateStudentById(Integer id);

	Student getPersonalInfoById(Integer id);

	void updatePersonalInfoById(Student student);

	List<Student> getProfessions();

	List<Student> getClazzByProfession(String profession);

	List<Student> getAllStudentList(StuQueryVo stuQueryVo);

	List<Student> getAllStudentListByLimit(StuQueryVo stuQueryVo);

	void addStudentToMyStuList(Integer managerId, int studentid);

	List<Student> getProfessionsByMid(Integer managerId);

	List<Student> getClazzByProfessionAndMid(Integer managerId, String profession);

}
