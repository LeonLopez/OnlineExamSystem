package vo;

import po.Questions;

public class AnswerDetailVo extends Questions {
	
	private int sturesultid;
	private int questionid;
	private int score;
	private String stuanswer;
	private String rightorwrong;
	
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getSturesultid() {
		return sturesultid;
	}
	public void setSturesultid(int sturesultid) {
		this.sturesultid = sturesultid;
	}
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	public String getStuanswer() {
		return stuanswer;
	}
	public void setStuanswer(String stuanswer) {
		this.stuanswer = stuanswer;
	}
	public String getRightorwrong() {
		return rightorwrong;
	}
	public void setRightorwrong(String rightorwrong) {
		this.rightorwrong = rightorwrong;
	}
	

}
