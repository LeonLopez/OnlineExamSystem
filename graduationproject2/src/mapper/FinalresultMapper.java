package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Finalresult;
import po.FinalresultExample;
import po.FinalresultKey;

public interface FinalresultMapper {
    int countByExample(FinalresultExample example);

    int deleteByExample(FinalresultExample example);

    int deleteByPrimaryKey(FinalresultKey key);

    int insert(Finalresult record);

    int insertSelective(Finalresult record);

    List<Finalresult> selectByExample(FinalresultExample example);

    Finalresult selectByPrimaryKey(FinalresultKey key);

    int updateByExampleSelective(@Param("record") Finalresult record, @Param("example") FinalresultExample example);

    int updateByExample(@Param("record") Finalresult record, @Param("example") FinalresultExample example);

    int updateByPrimaryKeySelective(Finalresult record);

    int updateByPrimaryKey(Finalresult record);
}