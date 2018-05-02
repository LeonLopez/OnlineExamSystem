package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.ManagerstudentExample;
import po.ManagerstudentKey;

public interface ManagerstudentMapper {
    int countByExample(ManagerstudentExample example);

    int deleteByExample(ManagerstudentExample example);

    int deleteByPrimaryKey(ManagerstudentKey key);

    int insert(ManagerstudentKey record);

    int insertSelective(ManagerstudentKey record);

    List<ManagerstudentKey> selectByExample(ManagerstudentExample example);

    int updateByExampleSelective(@Param("record") ManagerstudentKey record, @Param("example") ManagerstudentExample example);

    int updateByExample(@Param("record") ManagerstudentKey record, @Param("example") ManagerstudentExample example);
}