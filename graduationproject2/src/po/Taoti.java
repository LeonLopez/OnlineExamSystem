package po;

import java.util.Date;

public class Taoti {
    private Integer id;

    private String name;

    private String difficultylevel;

    private Integer singlenum;

    private Integer singlescore;

    private Integer multinum;

    private Integer multiscore;

    private Integer trueorfalsenum;

    private Integer trueorfalsescore;

    private Integer easyscore;

    private Integer ordinaryscore;

    private Integer difficultscore;

    private Integer totalscore;

    private Date createtime;

    private Integer lessonid;

    private Integer mid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDifficultylevel() {
        return difficultylevel;
    }

    public void setDifficultylevel(String difficultylevel) {
        this.difficultylevel = difficultylevel == null ? null : difficultylevel.trim();
    }

    public Integer getSinglenum() {
        return singlenum;
    }

    public void setSinglenum(Integer singlenum) {
        this.singlenum = singlenum;
    }

    public Integer getSinglescore() {
        return singlescore;
    }

    public void setSinglescore(Integer singlescore) {
        this.singlescore = singlescore;
    }

    public Integer getMultinum() {
        return multinum;
    }

    public void setMultinum(Integer multinum) {
        this.multinum = multinum;
    }

    public Integer getMultiscore() {
        return multiscore;
    }

    public void setMultiscore(Integer multiscore) {
        this.multiscore = multiscore;
    }

    public Integer getTrueorfalsenum() {
        return trueorfalsenum;
    }

    public void setTrueorfalsenum(Integer trueorfalsenum) {
        this.trueorfalsenum = trueorfalsenum;
    }

    public Integer getTrueorfalsescore() {
        return trueorfalsescore;
    }

    public void setTrueorfalsescore(Integer trueorfalsescore) {
        this.trueorfalsescore = trueorfalsescore;
    }

    public Integer getEasyscore() {
        return easyscore;
    }

    public void setEasyscore(Integer easyscore) {
        this.easyscore = easyscore;
    }

    public Integer getOrdinaryscore() {
        return ordinaryscore;
    }

    public void setOrdinaryscore(Integer ordinaryscore) {
        this.ordinaryscore = ordinaryscore;
    }

    public Integer getDifficultscore() {
        return difficultscore;
    }

    public void setDifficultscore(Integer difficultscore) {
        this.difficultscore = difficultscore;
    }

    public Integer getTotalscore() {
        return totalscore;
    }

    public void setTotalscore(Integer totalscore) {
        this.totalscore = totalscore;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getLessonid() {
        return lessonid;
    }

    public void setLessonid(Integer lessonid) {
        this.lessonid = lessonid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
}