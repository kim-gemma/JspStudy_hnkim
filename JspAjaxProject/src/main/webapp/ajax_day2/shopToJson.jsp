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
  
  String sql="select * from shop order by num";
  
  try{
  		pstmt=conn.prepareStatement(sql);
  		rs=pstmt.executeQuery();
  		
  		JSONArray arr=new JSONArray();
  		while(rs.next())
  		{
  			String num=rs.getString("num");
  			String sangpum=rs.getString("sangpum");
  			int price=rs.getInt("price");
  			String color=rs.getString("color");
  			String imgname=rs.getString("imgname");
  			
  			JSONObject ob=new JSONObject();
  			ob.put("num", num);
  			ob.put("sangname", sangpum);
  			ob.put("col", color);
  			ob.put("price", price);
  			ob.put("photo", imgname);
  			
  			arr.add(ob);
  		}%>
  		
  		<%=arr.toString() %>
  
  <%}catch(Exception e){
	  
  }finally{
	  db.dbClose(rs, pstmt, conn);
  }
%>
