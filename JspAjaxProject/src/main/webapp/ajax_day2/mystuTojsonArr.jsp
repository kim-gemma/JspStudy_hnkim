<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		DbConnect db=new DbConnect();
		Connection conn=db.getDbConnect();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mystu order by num";
		
		try{
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
			JSONArray arr=new JSONArray();
			
			while(rs.next())
			{
				String num=rs.getString("num");
	  			String name=rs.getString("stuname");
	  			String photo=rs.getString("stuphoto");
	  			int java=rs.getInt("java");
	  			int ajax=rs.getInt("ajax");
	  			
	  			JSONObject ob=new JSONObject();
	  			ob.put("num", num);
	  			ob.put("name", name);
	  			ob.put("photo", photo);
	  			ob.put("java", java);
	  			ob.put("ajax", ajax);
	  			
	  			//array에 추가
	  			arr.add(ob);
			}%>
		
		    <%=arr.toString() %>
		<%}catch(Exception e){
			
		}finally{
			db.dbClose(rs, pstmt, conn);
		}
%>