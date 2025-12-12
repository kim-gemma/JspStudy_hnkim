package oracle_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {

	String driver="oracle.jdbc.driver.OracleDriver";
	static final String ORACLE_URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	
	public DbConnect() {
		try {
			Class.forName(driver);
			System.out.println("오라클 드라이버 성공!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 드라이버 실패!!!");
		}
	}
	
	//오라클서버연결메서드(Connection)
	public Connection getDbConnect()
	{
		Connection conn=null;
		
		try {
			conn=DriverManager.getConnection(ORACLE_URL, "hnkim", "a1234");
			System.out.println("오라클 서버연결 성공!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("오라클 서버연결 실패!!!"+e.getMessage());
		}
		
		
		return conn;
	}
	
	//close 메서드 만들기
	public void dbClose(ResultSet rs,Statement stmt,Connection conn)
	{
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dbClose(Statement stmt,Connection conn)
	{
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
