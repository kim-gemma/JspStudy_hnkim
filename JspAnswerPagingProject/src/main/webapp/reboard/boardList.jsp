<%@page import="reboard.ReboardDao"%>
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
	//dao선언
	ReboardDao dao= new ReboardDao();
	//총갯수
	int totalCount=dao.getTotalCount();

%>
<body>
	<div style="margin:100px; width: 900px;">
		<button type="button" class="btn btn-secondary" onclick="location.href='addForm.jsp'">새글쓰기</button>
		<table class="table table-bordered">
			<caption align="top"><b><%=totalCount %>개의 게시글이 있습니다.</b></caption>
			<tr class="table-success">
				<th width="70">번호</th>
				<th width="370">제목</th>
				<th width="120">작성자</th>
				<th width="170">작성일</th>
				<th width="100">조회수</th>
			</tr>
			
			<%
				if(totalCount==0)
				{%>
					<tr>
						<td colspan="5" align="center">
							<b>등록된 게시글이 없습니다.</b>
						</td>
					</tr>
				<%} else {
					
				}
			%>
		</table>
	</div>
</body>
</html>