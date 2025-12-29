<%@page import="myboard.BoardDao"%>
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
  //num,pass
  String num=request.getParameter("num");
  String pass=request.getParameter("pass");
  
  //dao생성
  BoardDao dao=new BoardDao();
  
  //비번비교메서드 호출
  boolean check=dao.isPassCheck(num, pass);
  
  //true면 삭제후 목록이동..false면 경고창
  if(check){
	  dao.deleteBoard(num);%>
	  <script type="text/javascript">
	   alert("삭제성공\n목록으로 이동할게요~~");
	   location.href='boardList.jsp';
	  </script>
  <%}else{%>
	  <script type="text/javascript">
	    alert("비밀번호가 맞지않습니다");
	    history.back();
	  </script>
  <%}
%>
</body>
</html>