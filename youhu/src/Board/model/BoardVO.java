package Board.model;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardVO {
	
	private int bidx;
	private String subject;
	private String name;
	private String contents;
	private Timestamp indate; 
	private int downcg_code;
	private int midx;
	
	public BoardVO() {
		
	}
	
	public BoardVO(int bidx, String subject, String name, String contents, Timestamp indate, int downcg_code, int midx) {
		super();
		this.bidx = bidx;
		this.subject = subject;
		this.name = name;
		this.contents = contents;
		this.indate = indate;
		this.downcg_code = downcg_code;
		this.midx = midx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
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

	public Timestamp getIndate() {
		return indate;
	}

	public void setIndate(Timestamp indate) {
		this.indate = indate;
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
