<%@page import="guest.GuestDto"%>
<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
	
	//데이타 읽기(unum. unickname,ucontent,uemot)
	String num=request.getParameter("unum");
	String nick=request.getParameter("unickname");
	String content=request.getParameter("ucontent");
	String emot=request.getParameter("uemot");
	
	//dto로 묶기
	GuestDto dto=new GuestDto();
	dto.setNum(num);
	dto.setNickname(nick);
	dto.setContent(content);
	dto.setEmot(emot);
	
	//dao선언
	  GuestDao dao=new GuestDao();
	//update
	dao.updateGuest(dto);
%>