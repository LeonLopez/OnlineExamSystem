package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Taotiquestion;
import po.TaotiquestionExample;
import po.TaotiquestionKey;

public interface TaotiquestionMapper {
    int countByExample(TaotiquestionExample example);

    int deleteByExample(TaotiquestionExample example);

    int deleteByPrimaryKey(TaotiquestionKey key);

    int insert(Taotiquestion record);

    int insertSelective(Taotiquestion record);

    List<Taotiquestion> selectByExample(TaotiquestionExample example);

    Taotiquestion selectByPrimaryKey(TaotiquestionKey key);

    int updateByExampleSelective(@Param("record") Taotiquestion record, @Param("example") TaotiquestionExample example);

    int updateByExample(@Param("record") Taotiquestion record, @Param("example") TaotiquestionExample example);

    int updateByPrimaryKeySelective(Taotiquestion record);

    int updateByPrimaryKey(Taotiquestion record);
}