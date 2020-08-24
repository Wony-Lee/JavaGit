package user.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DAOBase;
import jdbc.util.DBUtil;
import user.domain.AddrVO;
import user.domain.UserVO;

public class AddrDAO extends DAOBase{


	public AddrDAO()
	{
		System.out.println("주소록 검색중..");
	}
	
	public ArrayList<AddrVO> makeList(ResultSet rs)
	throws SQLException
	{
		ArrayList<AddrVO> arr = new ArrayList<>();
		
		while(rs.next())
		{
			int new_post_code = rs.getInt("new_post_code");
			String sido_kor = rs.getString("sido_kor");
			String law_dong_name = rs.getString("law_dong_name");
			String upmyon_kor = rs.getString("upmyon_kor");
			String doro_num = rs.getString("doro_num");
			String doro_kor = rs.getString("doro_kor");
			String admin_dong_name = rs.getString("admin_dong_name");
			int jibeon_bonbeon = rs.getInt("jibeon_bonbeon");
			int jibeon_bubeon = rs.getInt("jibeon_bubeon");
			
			AddrVO addr = new AddrVO(new_post_code, sido_kor, law_dong_name, 
					upmyon_kor, doro_num, doro_kor, admin_dong_name, jibeon_bonbeon, jibeon_bubeon);
			arr.add(addr);
		} // while ----------
		
		return arr;
	}
	
	// 모든 주소 가져오기 
	public int getTotalUserCount() throws SQLException
	{
		try {
			con=DBUtil.getCon();
			String sql = "select count(idx) cnt from zipcode";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			return count;
		}
		finally {
			close();
		}
	}
	
	/** 모든 주소 가져오기 페이징 처리하기*/
	
	
	public ArrayList<AddrVO> searchAddr(String search)
	throws SQLException
	{
		con = DBUtil.getCon();
		try {
		ArrayList<AddrVO> list = new ArrayList<AddrVO>();
		String sql = "";
		StringBuilder buf 
		= new StringBuilder("SELECT *FROM ZIPCODE WHERE DORO_KOR like ?");
		sql = buf.toString();
		ps=con.prepareStatement(sql);
		ps.setString(1, "%"+search+"%");
		rs = ps.executeQuery();
		ArrayList<AddrVO> arr = makeList(rs);
		return arr;
		}
		finally {
			close();
		}
	}
	
	public ArrayList<AddrVO> listAddr(int start, int end) throws SQLException {
		try {
			con = DBUtil.getCon();
			String sql = "";
			StringBuilder buf = new StringBuilder("select * from(").append(" select rownum rn, a.* from")
					.append(" (select * from member order by idx desc) a").append(" )where rn between ? and ?");
			sql = buf.toString();
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<AddrVO> arr = makeList(rs);
			return arr;
		} finally {
			close();
		}
	}
	
	
	/*	public AddrVO searchAddr(String search)
	throws SQLException
	{
		try {
		//ArrayList<AddrVO> List = new ArrayList<AddrVO>();
		String sql = "";
		StringBuilder buf 
		= new StringBuilder("SELECT *FROM ZIPCODE WHERE DORO_KOR LIKE ?");
		sql = buf.toString();
		ps=con.prepareStatement(sql);
		ps.setString(1, "%"+search+"%");
		rs = ps.executeQuery();
		ArrayList<AddrVO> arr = makeList(rs);
		if(arr!=null&&arr.size()==1)
		{
			AddrVO advo = arr.get(0);
			return advo;
		}
		return null;
		}
		finally {
			close();
		}
	}*/
}
