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
   String name=request.getParameter("irum");
   String menu=request.getParameter("menu");
   String [] lang=request.getParameterValues("lang"); //선택안하면 null,선택하면 배열값이 넘어온다
%>
<body>
   <h3>quiz 폼태그로 부터 읽은값</h3>
   이름: <%=name %><br>
   점심메뉴: <img alt="" src="<%=menu%>" width="100"><br>
   가능IT언어:
   <%
     if(lang==null){%>
    	 <b style="color: red;">가능한 언어 없음</b>
     <%}else{
    	 for(String lg:lang){%>
    		 [<%=lg %>]&nbsp;&nbsp;
    	 <%}
     }
   %>
</body>
</html>