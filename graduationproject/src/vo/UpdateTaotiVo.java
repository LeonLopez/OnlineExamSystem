package vo;

public class UpdateTaotiVo {

	private int taotiid;
	private int score;
	public int getTaotiid() {
		return taotiid;
	}
	public void setTaotiid(int taotiid) {
		this.taotiid = taotiid;
	}
	public int getScore() {
		return score;
	}
	
	public void setScore(int score) {
		this.score = score;
	}
	public UpdateTaotiVo(int taotiid, int score) {
		super();
		this.taotiid = taotiid;
		this.score = score;
	}
}
