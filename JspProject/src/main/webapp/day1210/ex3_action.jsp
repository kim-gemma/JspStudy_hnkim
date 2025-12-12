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
<%
    //엔코딩..post방식일경우 한글깨짐
    request.setCharacterEncoding("utf-8");
    String name=request.getParameter("name");
	String pass=request.getParameter("pass");
	String dlic=request.getParameter("driverlic");
%>

<body>
	<h3>[결과값 출력]</h3>
	<b>이름: <%=name %></b><br>
	<b>비밀번호: <%=pass %></b><br>
	<b>운전면허: <%=dlic==null?"없음":"있음" %></b>
</body>
</html>