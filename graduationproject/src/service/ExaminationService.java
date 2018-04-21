package service;

import java.util.List;

import po.Examination;
import po.Pagination;
import vo.ExamListVo;

public interface ExaminationService {

	List<ExamListVo> getExamList();

	List<ExamListVo> getExamListByLimit(Pagination pagination);

	int addExam(Examination exam);

	int updateExam(Examination exam);

	void deleteExamById(int id);

	Examination getExamById(Integer id);


}
