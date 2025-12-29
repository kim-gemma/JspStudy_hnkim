<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //프론트에서 보낸 데이타 읽어오기
    String photono=request.getParameter("no");
	String photofood=request.getParameter("photofood");
	String like=request.getParameter("like");
  
  //프론트형태로 만들어서 front로 보내기
  JSONObject ob=new JSONObject();
  ob.put("photo","../image/Food/"+photono+".jpg");
  ob.put("food", photofood);
  ob.put("like", like);
%>
<%=ob.toString()%>