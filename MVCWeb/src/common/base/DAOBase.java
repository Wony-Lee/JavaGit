package common.base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//DAO 객체들의 부모 클래스
public class DAOBase {
	
	protected Connection con;
	protected PreparedStatement ps;
	protected ResultSet rs;
	
	public void close() throws SQLException
	{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(con!=null) con.close();
	}
}
