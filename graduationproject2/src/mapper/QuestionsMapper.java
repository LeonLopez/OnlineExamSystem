package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import po.Pagination;
import po.Questions;
import po.QuestionsExample;
import vo.AutoMakeTaotiVo;
import vo.ParamVo;
import vo.QuestionsListVo;
import vo.QuestionsQueryVo;
import vo.TaotiQuestionIdsVo;
import vo.TaotiQuestionsVo;

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

	List<TaotiQuestionsVo> getQuestionListByTaotiid(Integer taotiid);

	List<QuestionsListVo> getQuestionsListByLessonId(QuestionsQueryVo qqv);

	List<QuestionsListVo> getQuestionsListByLessonIdAndLimit(ParamVo paramVo);

	List<Questions> getQuestionListByAutoMakeTaotiVo(AutoMakeTaotiVo amtv);

	TaotiQuestionsVo getTaotiQuestionByTaotiQuestionIds(TaotiQuestionIdsVo tqIdsVo);

}