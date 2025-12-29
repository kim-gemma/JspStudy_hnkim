<%@page import="myboard.BoardAnswerDao"%>
<%@page import="myboard.BoardAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dto" class="myboard.BoardAnswerDto"/>
<jsp:useBean id="dao" class="myboard.BoardAnswerDao"/>
<jsp:setProperty name="dto" property="*"/>

<%
    dao.insertBoardAnswer(dto);
%>
