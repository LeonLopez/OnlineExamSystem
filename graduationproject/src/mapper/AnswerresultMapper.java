package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import po.Answerresult;
import po.AnswerresultExample;
import po.AnswerresultKey;
import vo.AnswerDetailVo;

public interface AnswerresultMapper {
    int countByExample(AnswerresultExample example);

    int deleteByExample(AnswerresultExample example);

    int deleteByPrimaryKey(AnswerresultKey key);

    int insert(Answerresult record);

    int insertSelective(Answerresult record);

    List<Answerresult> selectByExample(AnswerresultExample example);

    Answerresult selectByPrimaryKey(AnswerresultKey key);

    int updateByExampleSelective(@Param("record") Answerresult record, @Param("example") AnswerresultExample example);

    int updateByExample(@Param("record") Answerresult record, @Param("example") AnswerresultExample example);

    int updateByPrimaryKeySelective(Answerresult record);

    int updateByPrimaryKey(Answerresult record);

	List<AnswerDetailVo> getAnswerDetailListByResultId(Integer id);
}