package anim.model;

import java.io.Serializable;
import java.sql.Date;

public class AnimalVO implements Serializable {

	private String iidx;
	private String name;
	private String title;
	private String image;
	private String color;
	private String sex;
	private String weight;
	private String trans;
	private String addr;
	private String indate;
	private int astate;
	private String center;
	private String protect;
	private String tel;
	private Date intdate;
	private String form;
	
	public AnimalVO() {
		
	}

	public AnimalVO(String iidx, String name, String title, String image, String color, String sex, String weight, String trans,
			String addr, String indate, int astate, String center, String protect, String tel, Date intdate, String form) {
		super();
		this.iidx = iidx;
		this.name = name;
		this.title = title;
		this.image = image;
		this.color = color;
		this.sex = sex;
		this.weight = weight;
		this.trans = trans;
		this.addr = addr;
		this.indate = indate;
		this.astate = astate;
		this.center = center;
		this.protect = protect;
		this.tel = tel;
		this.intdate = intdate;
		this.form = form;
	}

	public String getIidx() {
		return iidx;
	}

	public void setIidx(String iidx) {
		this.iidx = iidx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public int getAstate() {
		return astate;
	}

	public void setAstate(int astate) {
		this.astate = astate;
	}

	public String getCenter() {
		return center;
	}

	public void setCenter(String center) {
		this.center = center;
	}

	public String getProtect() {
		return protect;
	}

	public void setProtect(String protect) {
		this.protect = protect;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getIntdate() {
		return intdate;
	}

	public void setIntdate(Date intdate) {
		this.intdate = intdate;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	
}