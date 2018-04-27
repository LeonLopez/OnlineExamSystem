package service;

import java.util.List;

import po.Pagination;
import po.Student;

public interface StudentService {

	List<Student> getStudentList(Integer managerId);

	List<Student> getStudentListByLimit(Pagination pagination, Integer managerId);

	void deleteStudentById(Integer id);

	int addStudent(Student student, Integer managerId);

	List<Student> checkStudent(Student student);

	List<Student> checkStudentByName(String name);

	void registerForStudent(Student student);

	void activateStudentById(Integer id);

	Student getPersonalInfoById(Integer id);

	void updatePersonalInfoById(Student student);

}
