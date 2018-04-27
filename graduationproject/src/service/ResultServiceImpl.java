package service;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.StudentresultMapper;
import po.Pagination;
import po.Studentresult;
import vo.QueryResultVo;
import vo.ResultListVo;
import vo.StudentListVo;

@Service
public class ResultServiceImpl implements ResultService{
	
	@Autowired
	private StudentresultMapper resultMapper;

	@Override
	public List<ResultListVo> getResultList(Integer managerId, ResultListVo rlv) {
		QueryResultVo qrv = new QueryResultVo(rlv,managerId); 
		return resultMapper.getResultList(qrv);
	}



	@Override
	public List<ResultListVo> getResultListByLimit(Pagination pagination, Integer managerId, ResultListVo rlv) {
		System.out.println(pagination);
		if(pagination.getPage()==null || pagination.getRows()==null){
			pagination = new Pagination();
			pagination.setPage(1);
			pagination.setRows(10);
		}
		pagination.setStartPage((pagination.getPage()-1)*pagination.getRows());
		QueryResultVo qrv = new QueryResultVo(rlv,managerId,pagination); 
		return resultMapper.getResultListByLimit(qrv);
	}



	@Override
	public List<String> getProfessionList(Integer managerId) {
		return resultMapper.getProfessionList(managerId);
	}



	@Override
	public List<Integer> getClazzList(Integer managerId) {
		return resultMapper.getClazzList(managerId);
	}



	@Override
	public List<String> getExamNameList() {
		return resultMapper.getExamNameList();
	}



	@Override
	public int addStudentresult(Studentresult result) {
		return resultMapper.insertSelective(result);
		
	}



	@Override
	public List<ResultListVo> getStuResultList(Integer studentId) {
		return resultMapper.getStuResultList(studentId);
	}



	@Override
	public void export(HttpServletResponse response, Workbook workbook, String fileName) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("utf-8"),"iso8859-1"));
		response.setContentType("application/ynd.ms-excel;charset=UTF-8");
		OutputStream out=response.getOutputStream();
		workbook.write(out);
		out.flush();
		out.close();
	}




}
