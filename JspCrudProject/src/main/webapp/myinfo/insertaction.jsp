<%@page import="myinfo.MyInfoDao"%>
<%@page import="myinfo.MyInfoDto"%>
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
  request.setCharacterEncoding("utf-8");

  String name=request.getParameter("name");
  String addr=request.getParameter("addr");
  
  //입력데이타를 dto로 묶어서
  MyInfoDto dto=new MyInfoDto();
  
  dto.setName(name);
  dto.setAddr(addr);
  
  //insert메서드에 전달
  MyInfoDao dao=new MyInfoDao();
  dao.insertMyinfo(dto);
  
  //목록으로 간다..주소값이 바뀜
  response.sendRedirect("infolist.jsp");
  
%>
<body>

</body>
</html>