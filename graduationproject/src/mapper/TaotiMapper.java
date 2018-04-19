package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import po.Pagination;
import po.Taoti;
import po.TaotiExample;
import vo.TaotiListVo;

public interface TaotiMapper {
    int countByExample(TaotiExample example);

    int deleteByExample(TaotiExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Taoti record);

    int insertSelective(Taoti record);

    List<Taoti> selectByExample(TaotiExample example);

    Taoti selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Taoti record, @Param("example") TaotiExample example);

    int updateByExample(@Param("record") Taoti record, @Param("example") TaotiExample example);

    int updateByPrimaryKeySelective(Taoti record);

    int updateByPrimaryKey(Taoti record);

	List<TaotiListVo> getTaotiListByLimit(Pagination pagination);

	List<TaotiListVo> getTaotiList();
}