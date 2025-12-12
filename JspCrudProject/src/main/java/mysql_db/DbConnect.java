package mysql_db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	// ※ 'cj' 를 반드시 포함해야 최신 MySQL(8.x 이상) 드라이버가 정상 동작함
	static final String MYSQLDRIVER="com.mysql.cj.jdbc.Driver";
	static final String MYSQL_URL="jdbc:mysql://localhost:3306/coffee";
	// MySQL 연결 URL
	// 형식: jdbc:mysql://호스트주소:포트번호/데이터베이스명
	// 여기서는 3306 포트를 사용하고, 'coffee' 라는 DB(스키마)에 접속함
	// DB 이름(coffee)만 프로젝트에 맞게 변경하면 됨
	
	
	public DbConnect() {
		try {
			Class.forName(MYSQLDRIVER);
			System.out.println("MYSQL 드라이버 성공!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("MYSQL 드라이버 실패!!!");
		}
	}
	
	//MYSQL서버연결메서드(Connection)
	public Connection getDbConnect()
	{
		Connection conn=null;
		
		try {
			//root일 경우 1234 , 본인걸로 할경우 비번 확인해봐 
			conn=DriverManager.getConnection(MYSQL_URL, "hnkim", "1234");
			System.out.println("MYSQL 서버연결 성공!!!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("MYSQL 서버연결 실패!!!"+e.getMessage());
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
