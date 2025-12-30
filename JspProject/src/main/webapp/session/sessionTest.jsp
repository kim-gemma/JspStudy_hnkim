<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gamja+Flower&family=Nanum+Myeongjo&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
  <%
   //세션 저장하는 방법
   session.setAttribute("msg", "Today is Monday!!!");
   session.setMaxInactiveInterval(60); //60초 유지시간지정,지정안할시 30분
   
  %>
  
  <h3>세션값 얻기</h3>
  세션값: <%=session.getAttribute("msg") %><br>
  세션유지시간: <%=session.getMaxInactiveInterval() %>초<br>
  세션 생성시간:<%=session.getCreationTime() %><br>
  세션생성시간Date: <%=new Date(session.getCreationTime()) %>
</body>
</html>