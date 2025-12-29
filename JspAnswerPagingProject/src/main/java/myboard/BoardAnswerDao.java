package myboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class BoardAnswerDao {
	DbConnect db=new DbConnect();
	
	//insert
	public void insertBoardAnswer(BoardAnswerDto dto) 
	{
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		
		String sql ="insert into myboardanswer values (null,?,?,?,now())";
		//String sql = "INSERT INTO myboardanswer (num, nickname, comment, writeday) VALUES (?,?,?,NOW())";

		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getNum());       // 🔥 FK
			pstmt.setString(2, dto.getNickname());
			pstmt.setString(3, dto.getComment());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//전체 댓글 출력
	public List<BoardAnswerDto> getAnswerList(String num){
		List<BoardAnswerDto> alist=new ArrayList<BoardAnswerDto>();
			Connection conn=db.getDbConnect();
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			
			String sql="select * from myboardanswer where num=? order by idx desc";
			
			try {
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, num);
				
				rs=pstmt.executeQuery();
				while(rs.next()) {
					BoardAnswerDto dto= new BoardAnswerDto();
					dto.setIdx(rs.getString("idx"));
					dto.setNum(rs.getString("num"));
					dto.setNickname(rs.getString("nickname"));
					dto.setComment(rs.getString("comment"));
					dto.setWriteday(rs.getTimestamp("writeday"));
					
					alist.add(dto);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, pstmt, conn);
			}
			
		return alist;
		
	}
}
