package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapper.ExamtimesMapper;
import po.Examtimes;
import po.ExamtimesKey;

@Service
public class ExamtimesServiceImpl implements ExamtimesService {
	
	@Autowired
	private ExamtimesMapper examtimesMapper;

	@Override
	public int getExamtimesBySid(Integer studentId, Integer id) {
		ExamtimesKey key = new ExamtimesKey();
		key.setSid(studentId);
		key.setExaminationid(id);
		Examtimes examtimes = examtimesMapper.selectByPrimaryKey(key);
		if(examtimes==null){
			return 0;
		}else{
			return examtimes.getTimescount();
		}
	}

	@Override
	public void updateExamtimesBySid(Integer studentId, Integer id) {
		Examtimes examtimes = new Examtimes();
		examtimes.setSid(studentId);
		examtimes.setExaminationid(id);

		int times = getExamtimesBySid(studentId,id);
		if(times==0){
			examtimes.setTimescount(1);
			examtimesMapper.insertSelective(examtimes);
		}
		else{
			examtimes.setTimescount(times+1);
			examtimesMapper.updateByPrimaryKey(examtimes);
		}
	}

}
