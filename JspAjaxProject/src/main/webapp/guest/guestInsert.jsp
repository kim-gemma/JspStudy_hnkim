<%@page import="guest.GuestDto"%>
<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  
	//엔코딩
	request.setCharacterEncoding("utf-8");
	
	//데이타 읽기(nickname,content,emot)
	String nick=request.getParameter("nickname");
	String content=request.getParameter("content");
	String emot=request.getParameter("emot");
	
	//dto로 묶기
	GuestDto dto=new GuestDto();
	dto.setNickname(nick);
	dto.setContent(content);
	dto.setEmot(emot);
	
	//dao선언
	  GuestDao dao=new GuestDao();
	//insert메서드
	dao.insertGuest(dto);
	  
%>