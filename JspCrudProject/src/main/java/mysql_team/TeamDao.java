package mysql_team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql_db.DbConnect;

public class TeamDao {
	DbConnect db= new DbConnect();
	
	//insert
	public void insertMyteam(TeamDto dto) {
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt =null;
		
		String sql="insert into myteam (name,addr,marry,gaipday) values (?,?,?,now())";
		
		try {
			pstmt =conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getMarry());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	//select
	public List<TeamDto> getAllTeams(){
		List<TeamDto> list = new Vector<TeamDto>();
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt =null;
		ResultSet rs=null;
		
		String sql="select * from myteam order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TeamDto dto= new TeamDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setMarry(rs.getString("marry"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
}
