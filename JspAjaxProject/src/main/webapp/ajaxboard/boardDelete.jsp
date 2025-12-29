<%@page import="ajaxboard.AjaxDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 String num=request.getParameter("num");
 AjaxDao dao=new AjaxDao();
 dao.deleteAjax(num);
%>