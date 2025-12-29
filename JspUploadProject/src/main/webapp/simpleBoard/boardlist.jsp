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
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd.");
%>
<body>
<div style="margin: 100px 100px; width: 1000px;">

   <h6 class="alert alert-info"><%=list.size() %>개의 글이 있습니다</h6>
    
   <table class="table table-bordered">
     <caption align="top"><b>게시판형 목록보기</b>
        <button type="button" class="btn btn-info"
        onclick="location.href='addForm.jsp'">글쓰기</button>
        <a><img alt="" src="../image/list1.png" style="width: 30px;"></a>
        <a href="imageList.jsp"><img alt="" src="../image/list2.png" style="width: 30px;"></a>
     </caption>
     
     <tr class="table-secondary">
        <th width="80">번호</th>
        <th width="480">제목</th>
        <th width="180">작성자</th>
        <th width="200">작성일</th>
        <th width="80">조회수</th>
     </tr>
     
     <%
       for(int i=0;i<list.size();i++)
       {
    	   BoardDto dto=list.get(i);
    	   %>
    	   
    	   <tr>
    	     <td align="center"><%=list.size()-i %></td>
    	     <td>
    	     <!--제목을 클릭시 내용보기로 연결  -->
    	     <a href="detailView.jsp?num=<%=dto.getNum()%>"
    	     style="text-decoration: none; color: black;"><%=dto.getSubject() %></a>
    	     </td>
    	     <td align="center"><%=dto.getWriter() %></td>
    	     <td><%=sdf.format(dto.getWriteday())%></td>
    	     <td align="center"><%=dto.getReadcount() %></td>
    	   </tr>
    	   
    	   
      <%}
     
     %>
     
     
   </table>
</div>
</body>
</html>