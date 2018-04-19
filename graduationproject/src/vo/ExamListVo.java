package vo;

import po.Examination;

public class ExamListVo extends Examination {

	private String taotiName;
	private String createuser;
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
