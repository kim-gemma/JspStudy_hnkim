<%@page import="member.MemberDao"%>
<%@page import="member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//insert 처리후 목록으로 이동... db에 값들이 들어왔는지 확인할것
	request.setCharacterEncoding("utf-8");
	
	//입력값 읽기
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String driver = request.getParameter("driver");
	String job = request.getParameter("job");
	
	System.out.print(driver); //확인, 체크인하면 null 히면  on
	
	//dto
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setHp(hp);
	dto.setDriver(driver==null? "없음": "있음");
	dto.setJop(job);
	
	//dao
	MemberDao dao=new MemberDao();
	dao.insertMember(dto);
	
	// 액션에서는 url 이 무조건 이동되어야함 그래야 제대로 작동된거임
	response.sendRedirect("memberlist.jsp");
%>
</body>
</html>