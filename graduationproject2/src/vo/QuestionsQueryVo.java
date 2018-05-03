package vo;

//自动组卷时用到的类，用于接收参数
public class QuestionsQueryVo {
	private Integer lessonid;
	private Integer knowledgeid;
	private String type;
	private String difficulty;
	public Integer getLessonid() {
		return lessonid;
	}
	public void setLessonid(Integer lessonid) {
		this.lessonid = lessonid;
	}
	public Integer getKnowledgeid() {
		return knowledgeid;
	}
	public void setKnowledgeid(Integer knowledgeid) {
		this.knowledgeid = knowledgeid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	
	

}
