package po;

import java.util.Date;

public class Studentresult {
    private Integer id;

    private Integer sid;

    private Integer resingle;

    private Integer resmore;

    private Integer restorf;

    private Integer restotal;

    private String ispass;

    private Date createtime;

    private Integer examinationid;

   
    
    
	public Studentresult(Integer sid, Integer resingle, Integer resmore, Integer restorf, Integer restotal,
			Date createtime, Integer examinationid) {
		super();
		this.sid = sid;
		this.resingle = resingle;
		this.resmore = resmore;
		this.restorf = restorf;
		this.restotal = restotal;
		this.createtime = createtime;
		this.examinationid = examinationid;
	}

	public Studentresult() {
		super();
	}



	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

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

    public Integer getExaminationid() {
        return examinationid;
    }

    public void setExaminationid(Integer examinationid) {
        this.examinationid = examinationid;
    }
}