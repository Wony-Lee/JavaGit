package Application.model;

import java.sql.Timestamp;

public class ApplicationVO {
	
	private int aidx;
	private String name;
	private int sex;
	private String birth;
	private int tel;
	private int post;
	private String addr1;
	private String addr2;
	private String contents;
	private Timestamp wdate;
	
	public ApplicationVO() {
		
	}
	
	public ApplicationVO(int aidx, String name, int sex, String birth, int tel, int post, String addr1, String addr2,
			String contents, Timestamp wdate) {
		super();
		this.aidx = aidx;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.tel = tel;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.contents = contents;
		this.wdate = wdate;
	}
	
	

	public ApplicationVO(String birth, int tel, int post, String addr1, String addr2) {
		super();
		this.birth = birth;
		this.tel = tel;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}

	public int getAidx() {
		return aidx;
	}

	public void setAidx(int aidx) {
		this.aidx = aidx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}



	public Timestamp getWdate() {
		return wdate;
	}



	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	
	
	
}
