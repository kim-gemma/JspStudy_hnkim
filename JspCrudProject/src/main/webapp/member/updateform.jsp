<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
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
</head>
<%
	String num=request.getParameter("num");
	MemberDao dao = new MemberDao();
	MemberDto dto= dao.getOneData(num);
%>
<body>
<!-- 원인                  설명               
 dto.getJop()가 null    value="" 상태가 됨     
 required="required"   빈값이면 submit 자체를 막음 
 required 제거하니 됨     빈값이어도 submit이 가능해짐 
 -->
	<form action="updateaction.jsp" method="post">
	<!-- form안 어디든 num을 hidden으로 넣어준다
	이유: update에서는 반드시 PK가 필요하다 사용자는 PK를 건드리면 안 된다 → hidden 으로 숨김 -->
	<input type="hidden" name="num" value="<%=num%>">
	
		<table class="table table-bordered" style="width: 400px">
			<caption align="top"><b>동아리 정보 수정</b></caption>
			<tr>
				<th width="120" class="table-success">회원명</th>
				<td>
					<input type="text" name="name" class="form-control"
					  value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<th width="120" class="table-success">연락처</th>
				<td>
					<input type="text" name="hp" class="form-control"
					style="width: 180px;" value="<%=dto.getHp()%>">
				</td>
			</tr>
			<tr>
				<th width="120" class="table-success">운전면허</th>
				<td>
					 <input type="checkbox" name="driver"
				        <%= "있음".equals(dto.getDriver()) ? "checked" : "" %>>
				        있음
				</td>
			</tr>
			<tr>
				<th width="120" class="table-success">직업</th>
				<td>
					<input type="text" name="job" class="form-control"
					 style="width: 180px;" value="<%=dto.getJop()%>">
				</td>
			</tr>
			<tr>
				<th width="120" class="table-success">버튼</th>
				   <td colspan="2" align="center">
		            <button type="submit" class="btn btn-outline-info">수정</button>
		            <button type="button" class="btn btn-outline-success"
		            onclick="location.href='memberlist.jsp'">목록</button>
		          </td>
			</tr>
		</table>
	</form>
</body>
</html>