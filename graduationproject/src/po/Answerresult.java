package po;

public class Answerresult extends AnswerresultKey {
    private String stuanswer;

    private String rightorwrong;

    public String getStuanswer() {
        return stuanswer;
    }

    public void setStuanswer(String stuanswer) {
        this.stuanswer = stuanswer == null ? null : stuanswer.trim();
    }

    public String getRightorwrong() {
        return rightorwrong;
    }

    public void setRightorwrong(String rightorwrong) {
        this.rightorwrong = rightorwrong == null ? null : rightorwrong.trim();
    }
}