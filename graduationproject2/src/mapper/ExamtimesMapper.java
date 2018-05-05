package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Examtimes;
import po.ExamtimesExample;
import po.ExamtimesKey;

public interface ExamtimesMapper {
    int countByExample(ExamtimesExample example);

    int deleteByExample(ExamtimesExample example);

    int deleteByPrimaryKey(ExamtimesKey key);

    int insert(Examtimes record);

    int insertSelective(Examtimes record);

    List<Examtimes> selectByExample(ExamtimesExample example);

    Examtimes selectByPrimaryKey(ExamtimesKey key);

    int updateByExampleSelective(@Param("record") Examtimes record, @Param("example") ExamtimesExample example);

    int updateByExample(@Param("record") Examtimes record, @Param("example") ExamtimesExample example);

    int updateByPrimaryKeySelective(Examtimes record);

    int updateByPrimaryKey(Examtimes record);
}