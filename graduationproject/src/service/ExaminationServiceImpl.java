package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ExaminationMapper;
import po.Examination;
import po.Pagination;
import vo.ExamListVo;

@Service
public class ExaminationServiceImpl implements ExaminationService{
	
	@Autowired
	private ExaminationMapper examinationMapper;

	@Override
	public List<ExamListVo> getExamList() {
		return examinationMapper.getExamList();
	}

	@Override
	public List<ExamListVo> getExamListByLimit(Pagination pagination) {
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		return examinationMapper.getExamListByLimit(pagination);
	}

	@Override
	public int addExam(Examination exam) {
		return examinationMapper.insertSelective(exam);
	}

	@Override
	public int updateExam(Examination exam) {
		return examinationMapper.updateByPrimaryKeySelective(exam);
	}

	@Override
	public void deleteExamById(int id) {
		examinationMapper.deleteByPrimaryKey(id);
	}
	
	

}
