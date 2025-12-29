package myshop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql_db.DbConnect;

public class ShopDao {

	DbConnect db =new DbConnect();
	//insert
	public void insertShop(ShopDto dto) {
		Connection conn =db.getDbConnect();
		PreparedStatement pstmt = null;
		
		  /*
	     * num 컬럼은 AUTO_INCREMENT 이므로 insert 시 제외
	     * writeday는 현재 날짜/시간을 DB에서 자동 저장하기 위해 now() 사용
	     *
	     * ❌ 전체 컬럼에 values(null,?,?,?,?,now()) 방식도 가능하지만
	     * ⭕ 컬럼명을 명시하는 방식이 구조 변경에 안전해서 더 권장됨
	     */
	    // String sql="insert into myshop values (null,?,?,?,?,now())";
		String sql="insert into myshop (sangpum,photo,price,ipgoday,writeday) values (?,?,?,?,now())";
		try {
			pstmt=conn.prepareStatement(sql);
			
			  /*
	         * ? (물음표)에 값 바인딩
	         * - 순서는 SQL 문에 작성된 컬럼 순서와 반드시 일치해야 함
	         */
			pstmt.setString(1, dto.getSangpum());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getIpgoday());
			 // insert / update / delete 실행 (행 개수 반환)
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체조회
	public List<ShopDto> getAllSangpums()
	{
		List<ShopDto> list=new Vector<ShopDto>();
		
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myshop order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				ShopDto dto=new ShopDto();
				
				//db에서 가져와서 dto에 담기
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				//list에 dto추가
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
	//하나의 데이타조회,num에 해당하는 하나의 dto
	public ShopDto getOneSangpum(String num)
	{
		ShopDto dto=new ShopDto();
		
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myshop where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				//db에서 가져와서 dto에 담기
				dto.setNum(rs.getString("num"));
				dto.setSangpum(rs.getString("sangpum"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setIpgoday(rs.getString("ipgoday"));
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
	//delete
	public void deleteShop(String num) {
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt = null;
		
		String sql="delete from myshop where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	} 
}
