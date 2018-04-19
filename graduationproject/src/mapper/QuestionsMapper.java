package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import po.Pagination;
import po.Questions;
import po.QuestionsExample;
import vo.QuestionsListVo;

public interface QuestionsMapper {
    int countByExample(QuestionsExample example);

    int deleteByExample(QuestionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Questions record);

    int insertSelective(Questions record);

    List<Questions> selectByExample(QuestionsExample example);

    Questions selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Questions record, @Param("example") QuestionsExample example);

    int updateByExample(@Param("record") Questions record, @Param("example") QuestionsExample example);

    int updateByPrimaryKeySelective(Questions record);

    int updateByPrimaryKey(Questions record);

	List<QuestionsListVo> getQuestionsList();

	List<QuestionsListVo> getQuestionsListByLimit(Pagination pagination);
}