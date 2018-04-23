package service;

import java.util.List;

import po.Pagination;
import po.Studentresult;
import vo.ResultListVo;

public interface ResultService {

	List<ResultListVo> getResultList(Integer managerId, ResultListVo rlv);


	List<String> getProfessionList(Integer managerId);

	List<Integer> getClazzList(Integer managerId);

	List<String> getExamNameList();

	List<ResultListVo> getResultListByLimit(Pagination pagination, Integer managerId, ResultListVo rlv);


	int addStudentresult(Studentresult result);


	List<ResultListVo> getStuResultList(Integer studentId);

}
