package po;

import java.util.Date;

public class Finalresult extends FinalresultKey {
    private Integer resingle;

    private Integer resmore;

    private Integer restorf;

    private Integer restotal;

    private String ispass;

    private Date createtime;

    public Integer getResingle() {
        return resingle;
    }

    public void setResingle(Integer resingle) {
        this.resingle = resingle;
    }

    public Integer getResmore() {
        return resmore;
    }

    public void setResmore(Integer resmore) {
        this.resmore = resmore;
    }

    public Integer getRestorf() {
        return restorf;
    }

    public void setRestorf(Integer restorf) {
        this.restorf = restorf;
    }

    public Integer getRestotal() {
        return restotal;
    }

    public void setRestotal(Integer restotal) {
        this.restotal = restotal;
    }

    public String getIspass() {
        return ispass;
    }

    public void setIspass(String ispass) {
        this.ispass = ispass == null ? null : ispass.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}