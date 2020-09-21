package Review.model;

import java.sql.Timestamp;

public class ReviewVO {
	
	private int ridx;
	private String subject;
	private String name;
	private String content;
	private Timestamp indate;
	private String image1;
	private String center; 
	private int downcg_code;
	private int midx;
	
	
	public ReviewVO() {
		
	}
	
	public ReviewVO(int ridx, String subject, String name, String content, Timestamp indate, String image1,
			String center ,int downcg_code, int midx) {
		super();
		this.ridx = ridx;
		this.subject = subject;
		this.name = name;
		this.content = content;
		this.indate = indate;
		this.image1 = image1;
		this.center = center;
		this.downcg_code = downcg_code;
		this.midx = midx;
	}



	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public void setIndate(Timestamp indate) {
		this.indate = indate;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getcenter() {
		return center;
	}
	public void setcenter(String center) {
		this.center = center;
	}
	public int getDowncg_code() {
		return downcg_code;
	}
	public void setDowncg_code(int downcg_code) {
		this.downcg_code = downcg_code;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	
}
