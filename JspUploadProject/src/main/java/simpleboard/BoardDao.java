package simpleboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class BoardDao {

	 DbConnect db=new DbConnect();
	 
	 //insert
	 public void insertBoard(BoardDto dto)
	 {
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 
		 String sql="insert into simpleboard values(null,?,?,?,?,?,0,now())";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImgname());
			pstmt.setString(5, dto.getPass());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	 }
	 
	 //전체데이타를 List에 담아서 리턴하는 메서드
	 public List<BoardDto> getAllDatas()
	 {
		 List<BoardDto> list=new Vector<BoardDto>();
		 
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		 //최신글이 맨위에 오도록 정렬
		 String sql="select * from simpleboard order by num desc";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				BoardDto dto=new BoardDto();
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImgname(rs.getString("imgname"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				//리스트에 추가
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
	 
	 //조회수 1증가하는 메서드(좋아요,추천 동일하게~~~)
	 public void updateReadcount(String num)
	 {
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 
		 String sql="update simpleboard set readcount=readcount+1 where num="+num;
		 
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
	 
	 //num에 해당하는 데이타 반환하는 메서드
	 public BoardDto getOneData(String num)
	 {
		 BoardDto dto=new BoardDto();
		 
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		 
		 String sql="select * from simpleboard where num="+num;
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setImgname(rs.getString("imgname"));
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
	 
	 //num과 pass를 받아서 비번이 맞으면 true,그렇지않으면 false를 반환하는 메서드
	 public boolean isEqualPass(String num,String pass)
	 {
		 boolean b=false;
		 
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		 
		 String sql="select count(*) from simpleboard where num=? and pass=?";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				if(rs.getInt(1)==1)
					b=true;
				//초기값이 false이므로 0인경우 false 는 전달 안해도됨
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		 
		 return b;
	 }
	 
	 //수정하는 메서드
	 public void updateBoard(BoardDto dto)
	 {
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 
		 //writer,subject,content,imgname만 수정할것!!!
		 String sql="update simpleboard set writer=?,subject=?,content=?,imgname=? where num=?";
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImgname());
			pstmt.setString(5, dto.getNum());
			
			//실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	 }
	 
	 //삭제
	 public void deleteBorad(String num)
	 {
		 Connection conn=db.getDbConnect();
		 PreparedStatement pstmt=null;
		 
		 String sql="delete from simpleboard where num="+num;
		 
		 try {
			pstmt=conn.prepareStatement(sql);
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
}
