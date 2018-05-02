package vo;

import po.Pagination;

public class StudentListVo {

	private Pagination pagination;
	private Integer managerId;
	
	public StudentListVo(){
		
	}
	
	public StudentListVo(Pagination pagination2, Integer managerId2) {
		this.pagination = pagination2;
		this.managerId = managerId2;
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
