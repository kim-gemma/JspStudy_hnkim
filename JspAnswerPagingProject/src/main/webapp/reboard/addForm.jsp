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
	String num= request.getParameter("num");
	String regroup="", relevel="", restep="", subject="";
	ReboardDao dao=new ReboardDao();
	
	if(num !=null){
		regroup=request.getParameter("regroup");
		relevel=request.getParameter("relevel");
		restep=request.getParameter("restep");
		
		subject="[답글]"+dao.getData(num).getSubject();
	}
	
%>
<body>
	<div style="margin: 100px 200px; width: 500px;">
		<form action="addAction.jsp" method="post">
		
			<%
				if(num!=null)
				{%>
					<input type="hidden" name="num" value="<%=num%>">
					<input type="hidden" name="regroup" value="<%=regroup%>">
					<input type="hidden" name="relevel" value="<%=relevel%>">
					<input type="hidden" name="restep" value="<%=restep%>">
				<%}
			%>
			<table class="table table-bordered">
				<caption align="top"><b><%=num==null? "새글등록":"답글등록"%></b></caption>
				<tr>
					<th class="table-secondary">작성자</th>
					<td>
						<input type="text" name="writer" class="form-control" style="width: 120px;" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-secondary">제목</th>
					<td>
						<input type="text" name="subject" class="form-control" style="width: 320px;" required="required">
					</td>
				</tr>
				<tr>
					<th class="table-secondary">비밀번호</th>
					<td>
						<input type="text" name="pass" class="form-control" style="width: 120px;" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="content" class="form-control"
						          style="width:100%; height:120px;"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="게시글 등록"
						       class="btn btn-success" style="width:120px;">
						<input type="button" value="목록이동"
						       class="btn btn-secondary" style="width:120px;"
						       onclick="location.href='boardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>