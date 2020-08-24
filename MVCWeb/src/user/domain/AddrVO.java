package user.domain;

import java.io.Serializable;

public class AddrVO implements Serializable {
	
	private int new_post_code;
	private String sido_kor;
	private String sido_eng;
	private String sigungu_kor;
	private String sigungu_eng;
	private String upmyon_kor;
	private String upmyon_eng;
	private String doro_num;
	private String doro_kor;
	private String doro_eng;
	private int under_flag;
	private int bld_origin_num;
	private int bld_refer_num;
	private String bld_manage_num;
	private String mul_deliver_name;
	private String sigungu_bld_name;
	private String law_dong_num;
	private String law_dong_name;
	private String ri_name;
	private String admin_dong_name;
	private String san_flag;
	private int jibeon_bonbeon;
	private int jibeon_bubeon;
	private String old_post_code;

	
	public AddrVO()
	{
		System.out.println("AddrVO() 불러오는 중...");
	}
	
	public AddrVO(int new_post_code, String sido_kor, String law_dong_name, 
			String upmyon_kor, String doro_num, String doro_kor, String admin_dong_name,
			int jibeon_bonbeon,int jibeon_bubeon)
	{
		this.new_post_code = new_post_code;
		this.sido_kor = sido_kor;
		this.law_dong_name = law_dong_name;
		this.upmyon_kor = upmyon_kor;
		this.doro_num = doro_num;
		this.doro_kor = doro_kor;
		this.admin_dong_name = admin_dong_name;
		this.jibeon_bonbeon = jibeon_bonbeon;
		this.jibeon_bubeon = jibeon_bubeon;
	}


	public String getSido_kor() {
		return sido_kor;
	}


	public void setSido_kor(String sido_kor) {
		this.sido_kor = sido_kor;
	}


	public String getSido_eng() {
		return sido_eng;
	}


	public void setSido_eng(String sido_eng) {
		this.sido_eng = sido_eng;
	}


	public String getSigungu_kor() {
		return sigungu_kor;
	}


	public void setSigungu_kor(String sigungu_kor) {
		this.sigungu_kor = sigungu_kor;
	}


	public String getSigungu_eng() {
		return sigungu_eng;
	}


	public void setSigungu_eng(String sigungu_eng) {
		this.sigungu_eng = sigungu_eng;
	}


	public String getUpmyon_kor() {
		return upmyon_kor;
	}


	public void setUpmyon_kor(String upmyon_kor) {
		this.upmyon_kor = upmyon_kor;
	}


	public String getUpmyon_eng() {
		return upmyon_eng;
	}


	public void setUpmyon_eng(String upmyon_eng) {
		this.upmyon_eng = upmyon_eng;
	}


	public String getDoro_num() {
		return doro_num;
	}


	public void setDoro_num(String doro_num) {
		this.doro_num = doro_num;
	}


	public String getDoro_kor() {
		return doro_kor;
	}


	public void setDoro_kor(String doro_kor) {
		this.doro_kor = doro_kor;
	}


	public String getDoro_eng() {
		return doro_eng;
	}


	public void setDoro_eng(String doro_eng) {
		this.doro_eng = doro_eng;
	}


	public int getUnder_flag() {
		return under_flag;
	}


	public void setUnder_flag(int under_flag) {
		this.under_flag = under_flag;
	}


	public int getBld_origin_num() {
		return bld_origin_num;
	}


	public void setBld_origin_num(int bld_origin_num) {
		this.bld_origin_num = bld_origin_num;
	}


	public int getBld_refer_num() {
		return bld_refer_num;
	}


	public void setBld_refer_num(int bld_refer_num) {
		this.bld_refer_num = bld_refer_num;
	}


	public String getBld_manage_num() {
		return bld_manage_num;
	}


	public void setBld_manage_num(String bld_manage_num) {
		this.bld_manage_num = bld_manage_num;
	}


	public String getMul_deliver_name() {
		return mul_deliver_name;
	}


	public void setMul_deliver_name(String mul_deliver_name) {
		this.mul_deliver_name = mul_deliver_name;
	}


	public String getSigungu_bld_name() {
		return sigungu_bld_name;
	}


	public void setSigungu_bld_name(String sigungu_bld_name) {
		this.sigungu_bld_name = sigungu_bld_name;
	}


	public String getLaw_dong_num() {
		return law_dong_num;
	}


	public void setLaw_dong_num(String law_dong_num) {
		this.law_dong_num = law_dong_num;
	}


	public String getLaw_dong_name() {
		return law_dong_name;
	}


	public void setLaw_dong_name(String law_dong_name) {
		this.law_dong_name = law_dong_name;
	}


	public String getRi_name() {
		return ri_name;
	}


	public void setRi_name(String ri_name) {
		this.ri_name = ri_name;
	}


	public String getAdmin_dong_name() {
		return admin_dong_name;
	}


	public void setAdmin_dong_name(String admin_dong_name) {
		this.admin_dong_name = admin_dong_name;
	}


	public String getSan_flag() {
		return san_flag;
	}


	public void setSan_flag(String san_flag) {
		this.san_flag = san_flag;
	}


	public int getJibeon_bonbeon() {
		return jibeon_bonbeon;
	}


	public void setJibeon_bonbeon(int jibeon_bonbeon) {
		this.jibeon_bonbeon = jibeon_bonbeon;
	}


	public int getJibeon_bubeon() {
		return jibeon_bubeon;
	}


	public void setJibeon_bubeon(int jibeon_bubeon) {
		this.jibeon_bubeon = jibeon_bubeon;
	}


	public String getOld_post_code() {
		return old_post_code;
	}


	public void setOld_post_code(String old_post_code) {
		this.old_post_code = old_post_code;
	}


	public int getNew_post_code() {
		return new_post_code;
	}


	public void setNew_post_code(int new_post_code) {
		this.new_post_code = new_post_code;
	}
	
}
