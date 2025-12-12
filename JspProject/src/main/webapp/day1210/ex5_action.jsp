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
  String sname=request.getParameter("s_name");
  String cbArea=request.getParameter("cbArea");
  String ipsaday=request.getParameter("ipsaday");
  String menu=request.getParameter("menu");
  String [] lang=request.getParameterValues("lang");
  String gift=request.getParameter("gift");
  String bgColor=request.getParameter("bgColor");
%>
<body>
<div style="background-color: <%=bgColor%>">
    <h3><%=sname %>사원의 선택결과</h3><br>
    <h3>해외근무가능여부:  <%=cbArea==null?"불가":"가능" %></h3>
    <h3>가장선호하는 점심메뉴: </h3>
    <img alt="" src="../image/Food/<%=menu%>.jpg" width="300">
    <h3>가능언어: 
        <%
         if(lang==null){%>
        	 가능언어 없음
         <%}else{
        	 for(String lge:lang){%>
        		 
        		 <b><%=lge %></b>&nbsp;&nbsp;
        	 <%}%>
        	  총<%=lang.length %>개의 언어가 가능합니다
         <%}
        %>
    </h3>
    
    <h3>선호하는 명절선물: </h3>
      <img alt="" src="<%=gift%>" width="200">
</div>
</body>
</html>