package myboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class BoardDao {
  
	DbConnect db=new DbConnect();
	
	//전체조회
//	public List<BoardDto> getAllDatas()
//	{
//		List<BoardDto> list=new ArrayList<BoardDto>();
//		
//		Connection conn=db.getDbConnect();
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//		
//		String sql="select * from myboard order by num desc";
//		
//		try {
//			pstmt=conn.prepareStatement(sql);
//			rs=pstmt.executeQuery();
//			
//			while(rs.next())
//			{
//				BoardDto dto=new BoardDto();
//				
//				dto.setNum(rs.getString("num"));
//				dto.setWriter(rs.getString("writer"));
//				dto.setSubject(rs.getString("subject"));
//				dto.setContent(rs.getString("content"));
//				dto.setPass(rs.getString("pass"));
//				dto.setReadcount(rs.getInt("readcount"));
//				dto.setWriteday(rs.getTimestamp("writeday"));
//				
//				//list에추가
//				list.add(dto);
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			db.dbClose(rs, pstmt, conn);
//		}
//		
//		return list;
//	}
	
	//insert
	public void insertBoard(BoardDto dto)
	{
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		
		String sql="insert into myboard values(null,?,?,?,0,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPass());
			
			//업데이트
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//num에 대한 하나의 dto
	public BoardDto getData(String num)
	{
		BoardDto dto=new BoardDto();
		
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myboard where num="+num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	
	//조회수증가
	public void updateReadCount(String num)
	{
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		
		String sql="update myboard set readcount=readcount+1 where num="+num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//비밀번호 맞는지 체크
	public boolean isPassCheck(String num,String pass)
	{
		boolean check=false;
		
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select count(*) from myboard where num=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getInt(1)==1) //비번이틀릴경우 0,초기값이 false니까 굳이 안줘도됨
					check=true;
			}
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return check;
	}
	
	//수정
	public void updateBoard(BoardDto dto)
	{
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		
		String sql="update myboard set writer=?,subject=?,content=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getNum());
			
			//업데이트
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//삭제
	public void deleteBoard(String num)
	{
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		
		String sql="delete from myboard where num="+num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//전체 갯수 반환(페이징처리 _ 1.전체갯수)
		public int getTotalCount()
		{
			int total=0;
			
			Connection conn=db.getDbConnect();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String sql="select count(*) from myboard";
			
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next())
					total=rs.getInt(1); //1번열
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			
			return total;
		}
		
	//2.부분조회(startNum부터 ,perPage갯수만큼 반환)
	public List<BoardDto> getPagingList(int startNum, int perPage)
	{
		List<BoardDto> list=new ArrayList<BoardDto>();
		
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myboard order by num desc limit ?,?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, perPage);
			
	        rs = pstmt.executeQuery();
			while(rs.next())
			{
				BoardDto dto=new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPass(rs.getString("pass"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				//list에추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
}
