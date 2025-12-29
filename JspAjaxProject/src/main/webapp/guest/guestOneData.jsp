<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.beans.SimpleBeanInfo"%>
<%@page import="guest.GuestDto"%>
<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num
	String num = request.getParameter("num");
	
	//dao선언
	GuestDao dao= new GuestDao();
	
	
	//리턴타입
	GuestDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	
	JSONObject ob= new JSONObject();
	ob.put("num", dto.getNum());
	ob.put("nick", dto.getNickname());
	ob.put("content", dto.getContent());
	ob.put("emot", dto.getEmot());
	ob.put("writeday", sdf.format(dto.getWriteday()));

//num안넘어와서 500번 에러나면 url에 직접 num 설정 http://localhost:8080/JspAjaxProject/guest/guestOneData.jsp?num=1
%>
<%=ob.toString()%>