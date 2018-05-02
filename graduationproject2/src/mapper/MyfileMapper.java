package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Myfile;
import po.MyfileExample;
import po.Pagination;
import vo.FileListVo;

public interface MyfileMapper {
    int countByExample(MyfileExample example);

    int deleteByExample(MyfileExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Myfile record);

    int insertSelective(Myfile record);

    List<Myfile> selectByExample(MyfileExample example);

    Myfile selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Myfile record, @Param("example") MyfileExample example);

    int updateByExample(@Param("record") Myfile record, @Param("example") MyfileExample example);

    int updateByPrimaryKeySelective(Myfile record);

    int updateByPrimaryKey(Myfile record);
    
    List<FileListVo> getFileList();

	List<FileListVo> getFileListByLimit(Pagination pagination);
}