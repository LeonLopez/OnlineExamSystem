package service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

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


	void export(HttpServletResponse response, Workbook workbook, String string) throws Exception;


	List<ResultListVo> getFinalResultList(Integer studentId);



}
