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
  //세션저장
  session.setAttribute("dragon", "sist");
  session.setMaxInactiveInterval(10);
  %>
  <h2>10초안에 클릭!!!</h2>
  <form action="sessionAction.jsp" method="post">
    <h2>배우고 싶은 IT언어</h2>
    <input type="radio" value="자바" name="lang" checked="checked">Java&nbsp;
    <input type="radio" value="Ajax" name="lang">Ajax&nbsp;
    <input type="radio" value="오라클" name="lang">Oracle&nbsp;
    <input type="radio" value="스프링" name="lang">Spring&nbsp;
    <input type="submit" value="수강신청">
  </form>
</body>
</html>