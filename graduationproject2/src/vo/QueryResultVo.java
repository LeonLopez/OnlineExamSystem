package vo;

import po.Pagination;

public class QueryResultVo {

	private ResultListVo rlv;
	public ResultListVo getRlv() {
		return rlv;
	}
	public void setRlv(ResultListVo rlv) {
		this.rlv = rlv;
	}
	private Integer managerId;
	private Pagination pagination;
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	public Pagination getPagination() {
		return pagination;
	}
	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}
	public QueryResultVo(ResultListVo rlv, Integer managerId) {
		super();
		this.rlv = rlv;
		this.managerId = managerId;
	}
	public QueryResultVo(ResultListVo rlv, Integer managerId, Pagination pagination) {
		super();
		this.rlv = rlv;
		this.managerId = managerId;
		this.pagination = pagination;
	}
	public QueryResultVo() {
		super();
	}

	
	
	
}
