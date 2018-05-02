package vo;

import po.Examination;

public class ExamListVo extends Examination {

	private String taotiName;
	private String createuser;
	private Integer totalscore;
	
	public Integer getTotalscore() {
		return totalscore;
	}
	public void setTotalscore(Integer totalscore) {
		this.totalscore = totalscore;
	}
	public String getTaotiName() {
		return taotiName;
	}
	public void setTaotiName(String taotiName) {
		this.taotiName = taotiName;
	}
	public String getCreateuser() {
		return createuser;
	}
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	
}
