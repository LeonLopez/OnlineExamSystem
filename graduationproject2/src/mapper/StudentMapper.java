package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import po.Pagination;
import po.Student;
import po.StudentExample;
import vo.StuQueryVo;
import vo.StudentListVo;

public interface StudentMapper {
    int countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
    
    List<Student> getStudentList(StudentListVo stuListVo);

	List<Student> getStudentListByLimit(StudentListVo stuListVo);

	int addStudent(Student student);

	void updateActivateById(Integer id);

	List<Student> getProfessions();

	List<Student> getClazzByProfession(String profession);

	List<Student> getAllStudentList(StuQueryVo stuQueryVo);

	List<Student> getAllStudentListByLimit(StuQueryVo stuQueryVo);

	List<Student> getProfessionsByMid(Integer managerId);


	List<Student> getClazzByProfessionAndMid(Integer managerId, String profession);

}