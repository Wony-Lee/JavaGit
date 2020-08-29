package youhu.parsistence;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import common.base.DAOBase;
import common.exception.NotUserException;
import user.model.MemberVO;


public class MemberDAO extends DAOBase{
      
        
       private DataSource ds;
       public MemberDAO() {
   		try {
   			Context ctx=new InitialContext();
   			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/youhu");
   			System.out.println("ds룩업 성공: "+ds);
   		} catch (Exception e) {
   			e.printStackTrace();
   		}
   	}//----------------------------
       public int insertMember(MemberVO user) throws SQLException{
    	   try {
    		   
    		  con=ds.getConnection();
    		 
			StringBuffer buf
			=new StringBuffer(" insert into member ( midx,name,id,pwd,")
				.append("  sex,post,addr1,addr2,tel,email,state ) ")
				.append("  values ( member_seq.nextval,?,?,?,?,?,?,")
				.append(" ?,?,?,?) ");
			String sql=buf.toString();
			
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getId());
			ps.setString(3, user.getPwd());
			ps.setInt(4, user.getSex());
			ps.setString(5, user.getPost());
			ps.setString(6, user.getAddr1());
			ps.setString(7, user.getAddr2());
			ps.setString(8, user.getTel());
			ps.setString(9, user.getEmail());
			ps.setInt(10, user.getState());
			
			int n=ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}//---------------------------------------------
       
       public MemberVO loginCheck(String id, String pwd) 
   			throws SQLException, NotUserException{
    	   MemberVO user=this.selectUserid(id);
   		if(user==null) {
   			//아이디가 존재하지 않는 경우
   			throw new NotUserException(id+"란 아이디는 존재하지 않아요!");
   		}
   		//비번 체크
   		if(!pwd.equals(user.getPwd())) {
   			throw new NotUserException("비밀번호가 일치하지 않아요!!");
   		}
   		//아이디와 비번이 일치하다면
   		return user;
   	}//--------------------------------------------
       
       public MemberVO selectUserid(String id) throws SQLException{
   		try {
   			con=ds.getConnection();
   			
   			String sql="select * from memberView where id=?";
   			  
   			ps=con.prepareStatement(sql);
   			ps.setString(1, id);
   			rs=ps.executeQuery();
   			List<MemberVO> arr=makeList(rs);
   			if(arr!=null && arr.size()==1) {
   				MemberVO user=arr.get(0);
   				return user;
   			}
   			return null;
   		} finally {
   			close();
   		}
   		
   	}//--------------------------------------------
       
       public List<MemberVO> listMember() throws SQLException{
   		try {
   			con=ds.getConnection();
   			String sql="Select * FROM member ORDER BY midx DESC";
   			ps=con.prepareStatement(sql);
   			rs=ps.executeQuery();
   			List<MemberVO> arr=makeList(rs);
   			return arr;
   		}finally {
   			close();
   		}		
   	}//----------------------------------------
   	
       
       private List<MemberVO> makeList(ResultSet rs) throws SQLException {
    	   List<MemberVO> arr=new ArrayList<>();
   		//반복문 돌면서 데이터 꺼내서 VO에 담고 arr에 저장하기
   		while(rs.next()) {
   			int midx=rs.getInt("midx");
   			String name=rs.getString("name");
   			String id=rs.getString("id");
   			String pwd=rs.getString("pwd");
   			int sex=rs.getInt("sex");
   			String post=rs.getString("post");
   			String addr1=rs.getString("addr1");
   			String addr2=rs.getString("addr2");
   			String tel=rs.getString("tel");
   			String email=rs.getString("email");
   			int mstatez=rs.getInt("statez");
   			MemberVO user
   			=new MemberVO(midx,name,id,pwd,sex,post,addr1,addr2,tel,
   							email,mstatez);
   			
   			arr.add(user);
   		}//while------------------
   		return arr;
	}
	public void close() {
    	   try {
    		   if(rs!=null) rs.close();
    		   if(ps!=null) ps.close();
    		   if(con!=null) con.close();
    	   }catch(Exception e) {
    		   System.out.println(e);
    	   }
       }
       
       
   	public boolean idCheck(String id) throws SQLException{
   		try {
   			con=ds.getConnection();
   			String sql="select midx from member where id=?";
   			ps=con.prepareStatement(sql);
   			ps.setString(1, id);
   			rs=ps.executeQuery();
   			//아이디는 unique제약조건을 주었기 때문에 있으면 1개의 결과를 반환, 없으면 
   			boolean bool=rs.next(); //==>true를 반환하면 해당 아이디가 존재
   									//==>false를 반환하면 해당 아이디가 없음
   			return !bool;
   		}finally {
   			close();
   		}
   	}//--------------------------------------------
   	public MemberVO selectUserByIdx(String midx) throws SQLException{
		try {
			con=ds.getConnection();
			String sql="select * from member where midx=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, midx);
			rs=ps.executeQuery();
			List<MemberVO> arr=makeList(rs);
			if(arr!=null && arr.size()==1) {
				MemberVO user=arr.get(0);
				return user;
			}
			return null;
		} finally {
			close();
		}
	}//--------------------------------------------
   	
     
   	public int updateMember(MemberVO user) throws SQLException{
		try {
			con=ds.getConnection();
			StringBuilder buf=new StringBuilder("update member set name=?,")
			.append(" id=?, pwd=?,sex=?,post=?,addr1=?,addr2=? , ")
			.append("  hp=?, email=?, statez=? where idx=?");
			String sql=buf.toString();
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getId());
			ps.setString(3, user.getPwd());
			ps.setInt(4, user.getSex());
			ps.setString(5, user.getPost());
			ps.setString(6, user.getAddr1());
			ps.setString(7, user.getAddr2());
			ps.setString(8, user.getTel());
			ps.setString(9, user.getEmail());
			ps.setInt(10, user.getState());
			ps.setInt(11, user.getMidx());
			return ps.executeUpdate();
		} finally {
			close();
		}
	}//--------------------------------------------
   	public int deleteMember(String midx) throws SQLException{
		try {
			con=ds.getConnection();
			StringBuilder buf=new StringBuilder("update member set statez=-1")
					.append(" where midx=?");
			String sql=buf.toString();
			ps=con.prepareStatement(sql);
			ps.setString(1, midx);
			int n=ps.executeUpdate();
			return n;
		} finally {
			close();
		}
	}//--------------------------------------------
   	public int getTotalUserCount() throws SQLException{
		try {
			con=ds.getConnection();
			String sql="select count(midx) cnt from member";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt("cnt");
			}
			return count;
		} finally {
			close();
		}
	}//---------------------------------------------
	
	
	public int getFindTotalUserCount(String type, String keyword)
	throws SQLException{
		try {
			String colName="";
			switch(type) {
				case "1": colName="name"; break;
				case "2": colName="id"; break;
				case "3": colName="hp"; break;			
			}
			con=ds.getConnection();
	String sql="select count(midx) cnt from member where "+colName+" like ?";
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt("cnt");
			}
			return count;
		} finally {
			close();
		}
	}
	public List<MemberVO> findMember(String type, String keyword, int start, int end) throws SQLException{
		try {
			con=ds.getConnection();
			String colName="name";
			switch(type) {
			case "1": colName="name";break;
			case "2": colName="id";break;
			case "3": colName="hp";break;
			}
			String sql=""; //wgho순서
			StringBuilder buf=new StringBuilder("select * from (")
					.append(" select rownum rn, a.* from")
					.append(" (select * from member where ")
					.append( colName+" like ?")
					.append(" order by midx desc) a")
					.append(" )where rn between ? and ?");
			sql=buf.toString();		
			System.out.println(sql);
			ps=con.prepareStatement(sql);
			ps.setString(1, "%"+keyword+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			List<MemberVO> arr=makeList(rs);
			return arr;
		}finally {
			close();
		}		
	}//----------------------------------------
       
}
