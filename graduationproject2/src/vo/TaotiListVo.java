package vo;


import po.Taoti;

public class TaotiListVo extends Taoti{

	private Integer lessonid;
	private String lessonname;
	private String createuser;
	
	
	public Integer getLessonid() {
		return lessonid;
	}
	public void setLessonid(Integer lessonid) {
		this.lessonid = lessonid;
	}
	public String getLessonname() {
		return lessonname;
	}
	public void setLessonname(String lessonname) {
		this.lessonname = lessonname;
	}
	public String getCreateuser() {
		return createuser;
	}
	public void setCreateuser(String createuser) {
		this.createuser = createuser;
	}
	
	
	
}
