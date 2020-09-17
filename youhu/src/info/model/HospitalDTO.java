package info.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class HospitalDTO implements Serializable {

	private String wrkp_nm; //������
	private String site_post_no; //���� ���� �ּ�
	private String trd_state_gbn_ctn; //��������
	private int site_tel; //����ó
	
	public HospitalDTO() {}

	public HospitalDTO(String wrkp_nm, String site_post_no, String trd_state_gbn_ctn, int site_tel) {
		super();
		this.wrkp_nm = wrkp_nm;
		this.site_post_no = site_post_no;
		this.trd_state_gbn_ctn = trd_state_gbn_ctn;
		this.site_tel = site_tel;
	}


	public String getWrkp_nm() {
		return wrkp_nm;
	}


	public void setWrkp_nm(String wrkp_nm) {
		this.wrkp_nm = wrkp_nm;
	}


	public String getSite_post_no() {
		return site_post_no;
	}


	public void setSite_post_no(String site_post_no) {
		this.site_post_no = site_post_no;
	}


	public String getTrd_state_gbn_ctn() {
		return trd_state_gbn_ctn;
	}


	public void setTrd_state_gbn_ctn(String trd_state_gbn_ctn) {
		this.trd_state_gbn_ctn = trd_state_gbn_ctn;
	}


	public int getSite_tel() {
		return site_tel;
	}


	public void setSite_tel(int site_tel) {
		this.site_tel = site_tel;
	}
	
	
}
