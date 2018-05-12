package service;

public interface ExamtimesService {

	int getExamtimesBySid(Integer studentId, Integer id);

	void updateExamtimesBySid(Integer studentId, Integer id);

}
