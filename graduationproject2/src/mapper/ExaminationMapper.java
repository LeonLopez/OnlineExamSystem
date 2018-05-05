package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Examination;
import po.ExaminationExample;
import po.Pagination;
import vo.ExamListVo;
import vo.ExamnameVo;

public interface ExaminationMapper {
    int countByExample(ExaminationExample example);

    int deleteByExample(ExaminationExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Examination record);

    int insertSelective(Examination record);

    List<Examination> selectByExampleWithBLOBs(ExaminationExample example);

    List<Examination> selectByExample(ExaminationExample example);

    Examination selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Examination record, @Param("example") ExaminationExample example);

    int updateByExampleWithBLOBs(@Param("record") Examination record, @Param("example") ExaminationExample example);

    int updateByExample(@Param("record") Examination record, @Param("example") ExaminationExample example);

    int updateByPrimaryKeySelective(Examination record);

    int updateByPrimaryKeyWithBLOBs(Examination record);

    int updateByPrimaryKey(Examination record);
    
    List<ExamListVo> getExamList();

	List<ExamListVo> getExamListByLimit(Pagination pagination);

	List<ExamnameVo> getExaminations();

}