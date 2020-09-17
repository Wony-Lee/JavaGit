package youhu.parsistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.base.DAOMyBatisBase;
import info.model.infoVO;


public class infoDAO extends DAOMyBatisBase{
	
	protected Connection con;
	protected PreparedStatement ps;
	protected ResultSet rs;
	private final String NS="info.mapper.InfoMapper";
	private SqlSession ses;
	
	public infoDAO() {
		System.out.println("infoDAO()����...");
	}
	
	/**������ ��ġ���� ��Ȳ ����Ʈ*/
	
	  public List<infoVO> selectByArea(String years){ try {
		  ses=this.getSqlSessionFactory().openSession();
		  List<infoVO> arr=ses.selectList(NS+".selectByArea",years);
	   
		  return arr;
	  } finally { 
		  close(ses); 
		  } 
	  }
	 
	/**������ ��Ȳ ����Ʈ */
	  public List<infoVO> selectByDog(String years){ try {
		  ses=this.getSqlSessionFactory().openSession();
		  List<infoVO> arr=ses.selectList(NS+".selectByDog",years);
		  return arr;
	  } finally { 
		  close(ses); 
		  } 
	  }
	  
	  public List<infoVO> selectByCat(String years){ try {
		  ses=this.getSqlSessionFactory().openSession();
		  List<infoVO> arr=ses.selectList(NS+".selectByCat",years);
	   
		  return arr;
	  } finally { 
		  close(ses); 
		  } 
	  }
	  
	  public List<infoVO> selectByEtc(String years){ try {
		  ses=this.getSqlSessionFactory().openSession();
		  List<infoVO> arr=ses.selectList(NS+".selectByEtc",years);
		  return arr;
	  } finally { 
		  close(ses); 
		  } 
	  }
	  
	public void close() throws SQLException{
		if(rs!=null)rs.close();
		if(ps!=null)ps.close();
		if(con!=null)con.close();
		
	}

}
