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
<h3>ex2_include하기</h3>

<h3>한글전달시 깨지면??</h3>
<%
    request.setCharacterEncoding("utf-8");
%>

   <jsp:include page="ex2_include.jsp">
     <jsp:param value="Happy Day!!!!" name="msg"/>
     <jsp:param value="../image/Food/1.jpg" name="foodName"/>
     <jsp:param value="김영수" name="sawonName"/>
   </jsp:include>
</body>
</html>