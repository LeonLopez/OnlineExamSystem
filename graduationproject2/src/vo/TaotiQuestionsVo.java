package vo;

import java.util.Date;

import po.Questions;

//用于获取某taoti中的questions
public class TaotiQuestionsVo {
	private int score;

	
	private Integer id;

    private String subject;

    private String type;

    private Date createtime;

    private String optiona;

    private String optionb;

    private String optionc;

    private String optiond;

    private String answer;

    private String judgeanswer;

    private String note;

    private String difficulty;

    private Integer lessonid;

    private Integer knowledgeid;

    private Integer mid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getOptiona() {
        return optiona;
    }

    public void setOptiona(String optiona) {
        this.optiona = optiona == null ? null : optiona.trim();
    }

    public String getOptionb() {
        return optionb;
    }

    public void setOptionb(String optionb) {
        this.optionb = optionb == null ? null : optionb.trim();
    }

    public String getOptionc() {
        return optionc;
    }

    public void setOptionc(String optionc) {
        this.optionc = optionc == null ? null : optionc.trim();
    }

    public String getOptiond() {
        return optiond;
    }

    public void setOptiond(String optiond) {
        this.optiond = optiond == null ? null : optiond.trim();
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public String getJudgeanswer() {
        return judgeanswer;
    }

    public void setJudgeanswer(String judgeanswer) {
        this.judgeanswer = judgeanswer == null ? null : judgeanswer.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty == null ? null : difficulty.trim();
    }

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

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	

}
