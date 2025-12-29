<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboard.BoardDao"%>
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
  BoardDao dao=new BoardDao();
  List<BoardDto> list=dao.getAllDatas();
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd. HH:mm.");
%>
<body>
<div style="margin: 100px 200px; width: 1000px;">
   <table class="table table-boarderd">
       <caption align="top"><b>이미지형 목록보기</b>
        <button type="button" class="btn btn-info"
        onclick="location.href='addForm.jsp'">글쓰기</button>
        <a href="boardlist.jsp"><img alt="" src="../image/list1.png" style="width: 30px;"></a>
        <a ><img alt="" src="../image/list2.png" style="width: 30px;"></a>
     </caption>
     
     <tr>
       <%
         for(int i=0;i<list.size();i++)
         {
        	 BoardDto dto=list.get(i);
        	 %>
        	 
        	 <td>
        	   <img alt="" src="../save/<%=dto.getImgname()%>"
        	   style="width: 240px; height: 240px; border: 1px solid gray;">
        	   <br>
        	   <b><%=dto.getSubject() %></b><br>
        	   <%=dto.getWriter() %><br>
        	   <span style="color: gray;font-size: 0.9em;"><%=sdf.format(dto.getWriteday()) %></span>
        	   <span style="color: gray;font-size: 0.9em;">조회: <%=dto.getReadcount() %></span>
        	 </td>
         <%
          if((i+1)%4==0)
          {%>
        	  </tr><tr>
          <%}
         
         
         }
       %>
     </tr>
     
     
   </table>
</div>
</body>
</html>