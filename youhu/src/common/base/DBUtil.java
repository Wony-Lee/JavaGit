package common.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil 
{
	private static String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static String user = "youhu", pwd="youhu123";
	// static 블럭은 클래스 로딩 타임에 가장 먼저 메모리에 올라가는 영역
	// main()메소드보다도 먼저 올라감
	static 
		{
			try 
			{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Loading Success..");			
			}
			catch(ClassNotFoundException e)
			{
				e.printStackTrace();
			}
		} // static initializer
	public static Connection getCon() throws SQLException
	{

		Connection con=DriverManager.getConnection(url,user,pwd);
		return con;
	}
}


