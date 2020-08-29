package user.model;

public class MemberVO {
   private int midx;
   private String name;
   private String id;
   private String pwd;
   private int sex;
   private String post;
   private String addr1;
   private String addr2;
   private String tel;
   private String email;
   private int state;  // 0: 일반회원 , 1: 탈퇴회원 , 2: 관리자 
       
   public MemberVO() {
   
   }

   
   
	public MemberVO(int midx, String name, String id, String pwd, int sex, String post, String addr1, String addr2,
		String tel, String email, int state) {
	super();
	this.midx = midx;
	this.name = name;
	this.id = id;
	this.pwd = pwd;
	this.sex = sex;
	this.post = post;
	this.addr1 = addr1;
	this.addr2 = addr2;
	this.tel = tel;
	this.email = email;
	this.state = state;
}



	public int getMidx() {
		return midx;
	}
	
	public void setMidx(int midx) {
		this.midx = midx;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPwd() {
		return pwd;
	}
	
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public int getSex() {
		return sex;
	}
	
	public void setSex(int sex) {
		this.sex = sex;
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
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	
}

