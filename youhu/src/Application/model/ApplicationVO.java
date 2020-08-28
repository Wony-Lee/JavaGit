package Application.model;

import java.sql.Timestamp;

public class ApplicationVO {
	
	private int aidx;
	private String name;
	private int sex;
	private String birth;
	private String tel;
	private String post;
	private String addr1;
	private String addr2;
	private String contents;
	private Timestamp wdate;
	private int midx;
	private int downcg_code;
	
	public ApplicationVO() {
		
	}
	
	public ApplicationVO(int aidx, String name, int sex, String birth, String tel, String post, String addr1, String addr2,
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
	
	public ApplicationVO(int aidx, String name, int sex, String birth, String tel, String post, String addr1, String addr2,
			String contents, Timestamp wdate, int midx, int downcg_code) {
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
		this.midx = midx;
		this.downcg_code = downcg_code;
	}
	

	public ApplicationVO(String birth, String tel, String post, String addr1, String addr2) {
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
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
