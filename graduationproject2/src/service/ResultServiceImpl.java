package service;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import mapper.FinalresultMapper;
import mapper.StudentresultMapper;
import po.Finalresult;
import po.FinalresultKey;
import po.Pagination;
import po.Studentresult;
import vo.QueryResultVo;
import vo.ResultListVo;
import vo.StudentListVo;

@Service
public class ResultServiceImpl implements ResultService{
	
	@Autowired
	private StudentresultMapper resultMapper;
	@Autowired
	private FinalresultMapper finalresultMapper;

	@Override
	public List<ResultListVo> getResultList(Integer managerId, ResultListVo rlv) {
		QueryResultVo qrv = new QueryResultVo(rlv,managerId); 
		return resultMapper.getResultList(qrv);
	}



	@Override
	public List<ResultListVo> getResultListByLimit(Pagination pagination, Integer managerId, ResultListVo rlv) {
		System.out.println(pagination);

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
	@Transactional
	public int addStudentresult(Studentresult result) {
		System.out.println("插入成绩中");
		int i = resultMapper.insertSelective(result);
		Finalresult fr = new Finalresult();
		fr.setSid(result.getSid());
		fr.setExaminationid(result.getExaminationid());
		fr.setResingle(result.getResingle());
		fr.setResmore(result.getResmore());
		fr.setRestorf(result.getRestorf());
		fr.setRestotal(result.getRestotal());
		fr.setIspass(result.getIspass());
		fr.setCreatetime(result.getCreatetime());
		
		FinalresultKey finalresultKey = new FinalresultKey();
		finalresultKey.setSid(result.getSid());
		finalresultKey.setExaminationid(result.getExaminationid());
		Finalresult finalresult = finalresultMapper.selectByPrimaryKey(finalresultKey);
		if(finalresult==null ){
			finalresultMapper.insertSelective(fr);
		}else{
			//如果考试成绩总分大于最终成绩表的总分，则将该成绩覆盖之前的数据
			if(finalresult.getRestotal()<result.getRestotal()){
				finalresultMapper.updateByPrimaryKeySelective(fr);
			}
		}
		return i;
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



	@Override
	public List<ResultListVo> getFinalResultList(Integer studentId) {
		return resultMapper.getFinalResultList(studentId);
	}




}
