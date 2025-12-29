<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.BoardDao"%>
<%@page import="simpleboard.BoardDto"%>
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
<style type="text/css">
.day,.read{
  font-size: 0.9em;
  color: gray;
}
</style>
</head>
<%
//num읽기
String num=request.getParameter("num");
//dao선언
BoardDao dao=new BoardDao();
//num으로 얻어온 하나의 dto
BoardDto dto=dao.getOneData(num);
//조회수증가
dao.updateReadcount(num);
//날짜포맷
SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd. HH:mm");
%>
<body>
<div style="margin: 200px 200px;">
<table class="table table-condensed" style="width: 700px;">
   <tr>
      <td>
         <h4><b><%=dto.getSubject() %></b></h4><br>
         <b><%=dto.getWriter() %></b><br>
         <span class="day"><%=sdf.format(dto.getWriteday()) %></span>&nbsp;&nbsp;
         <span class="read">조회 &nbsp;&nbsp;<%=dto.getReadcount() %></span>
      </td>
   </tr>
   
   <tr>
     <td>
       <a href="../save/<%=dto.getImgname()%>" target="_blank">
       <img alt="" src="../save/<%=dto.getImgname()%>" style="max-width: 200px;"></a>
       
       <br><br>
       <%=dto.getContent().replace("\n", "<br>") %>
     </td>
   </tr>
    
    
    <tr>
      <td align="right">
        <button type="button" class="btn btn-outline-primary"
        onclick="location.href='addForm.jsp'">글쓰기</button>
        <button type="button" class="btn btn-outline-primary"
        onclick="location.href='updateForm.jsp?num=<%=dto.getNum()%>'">수정</button>
        <button type="button" class="btn btn-outline-primary"
        onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
        <button type="button" class="btn btn-outline-primary"
        onclick="location.href='boardlist.jsp'">목록</button>
      </td>
    </tr>
    
</table>


</div>
</body>
</html>