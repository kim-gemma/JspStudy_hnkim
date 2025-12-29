<%@page import="ajaxboard.AjaxDao"%>
<%@page import="ajaxboard.AjaxDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//post
	request.setCharacterEncoding("utf-8");
	
    String num=request.getParameter("unum");
	String writer=request.getParameter("uwriter");
	String subject=request.getParameter("usubject");
	String content=request.getParameter("ucontent");
	String avata=request.getParameter("uavata");
	
	//dto선언
	AjaxDto dto=new AjaxDto();
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setAvata(avata);
	dto.setNum(num);
	
	//update
	AjaxDao db=new AjaxDao();
	db.updateAjax(dto);
%>