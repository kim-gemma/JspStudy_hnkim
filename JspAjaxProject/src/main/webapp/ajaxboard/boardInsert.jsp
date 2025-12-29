<%@page import="ajaxboard.AjaxDao"%>
<%@page import="ajaxboard.AjaxDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //post
  request.setCharacterEncoding("utf-8");
  
  String name=request.getParameter("writer");
  String subject=request.getParameter("subject");
  String story=request.getParameter("content");
  String avata=request.getParameter("avata");
  
  //dto선언
  AjaxDto dto=new AjaxDto();
  dto.setWriter(name);
  dto.setSubject(subject);
  dto.setContent(story);
  dto.setAvata(avata);
  
  //insert
  AjaxDao db=new AjaxDao();
  db.insertAjax(dto);
%>