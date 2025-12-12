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
   String sawon_Name="김민수";
   String buseo="인사팀";
   int age=32;
 
%>
<!-- h4태그로 인사팀에 있는 김민수사원의 나이는 32세 입니다 -->
<h4 style="background-color: aqua;"><%=buseo %>에 있는 <%=sawon_Name %>사원의 나이는 <%=age %>세 입니다</h4>

<h2>자바의 배열선언</h2>
<%
    //자바의 배열선언
    String [] colors={"red","yellow","gray","blue","orange","purple"};
    //제목
    String title="배열출력";
%>

<table style="width: 200px;" class="table table-bordered">
    <caption align="top"><b><%=title %></b></caption>
    <tr>
       <th>번호</th>
       <th>색상</th>
    </tr>
    <%
       for(int i=0;i<colors.length;i++)
       {%>
    	   <tr>
    	     <td align="center"><%=i+1 %></td>
    	     <td style="color: <%=colors[i]%>"><%=colors[i] %></td>
    	   </tr>
       <%}
    %>
</table>

</body>
</html>