<%@page import="guest.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num
	String num=request.getParameter("num");
	//dao
	GuestDao dao= new GuestDao();
	//delete메소드 호출
	dao.deleteGuest(num);

%>