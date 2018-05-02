package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Studentresult;
import po.StudentresultExample;
import vo.QueryResultVo;
import vo.ResultListVo;

public interface StudentresultMapper {
    int countByExample(StudentresultExample example);

    int deleteByExample(StudentresultExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Studentresult record);

    int insertSelective(Studentresult record);

    List<Studentresult> selectByExample(StudentresultExample example);

    Studentresult selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Studentresult record, @Param("example") StudentresultExample example);

    int updateByExample(@Param("record") Studentresult record, @Param("example") StudentresultExample example);

    int updateByPrimaryKeySelective(Studentresult record);

    int updateByPrimaryKey(Studentresult record);
    
    List<ResultListVo> getResultList(QueryResultVo qrv);

	List<ResultListVo> getResultListByLimit(QueryResultVo qrv);

	List<String> getProfessionList(Integer managerId);

	List<Integer> getClazzList(Integer managerId);

	List<String> getExamNameList();

	List<ResultListVo> getStuResultList(Integer studentId);
}