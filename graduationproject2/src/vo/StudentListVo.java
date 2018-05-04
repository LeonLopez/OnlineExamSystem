package vo;

import po.Pagination;
import po.Student;

public class StudentListVo {
	
	
	private Student student;
	private Pagination pagination;
	private Integer managerId;
	
	public StudentListVo(){
		
	}
	
	
	public StudentListVo(Student student, Integer managerId, Pagination pagination) {
		super();
		this.student = student;
		this.pagination = pagination;
		this.managerId = managerId;
	}


	public StudentListVo(Student student, Integer managerId) {
		super();
		this.student = student;
		this.managerId = managerId;
	}


	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	
}
