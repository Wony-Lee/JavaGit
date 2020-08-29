package Board.model;

import java.sql.Date;

public class BoardVO {
	
	private int ridx;
	private String subject;
	private String name;
	private String contents;
	private Date indate;
	private String image;
	private String image2; 
	private int downcg_code;
	private int midx;
	
	public BoardVO() {
		
	}
	
	public BoardVO(int ridx, String subject, String name, String contents, Date indate, String image, String image2,
			int downcg_code, int midx) {
		super();
		this.ridx = ridx;
		this.subject = subject;
		this.name = name;
		this.contents = contents;
		this.indate = indate;
		this.image = image;
		this.image2 = image2;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getIndate() {
		return indate;
	}

	public void setIndate(Date indate) {
		this.indate = indate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
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
