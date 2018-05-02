package po;

import java.util.Date;

public class Myfile {
    private Integer id;

    private String filename;

    private Date createtime;

    private Integer mid;

  
    

	public Myfile() {
		super();
	}



	public Myfile(String filename, Date createtime, Integer mid) {
		super();
		this.filename = filename;
		this.createtime = createtime;
		this.mid = mid;
	}



	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }
}