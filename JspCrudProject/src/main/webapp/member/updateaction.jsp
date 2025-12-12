<%@page import="member.MemberDao"%>
<%@page import="member.MemberDto"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
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
<body>
	<%
	// 여기서 제일 중요한것 num!!!!!!!!!!!!!!!!!!!!!!!!!
		request.getParameter("utf-8");
		
		//String num= request.getParameter("num");
		//String name= request.getParameter("name");
		//String hp= request.getParameter("hp");
		//String driver = request.getParameter("driver");
		//String job= request.getParameter("job");
		
		//입력값 읽어서 dto담기
		MemberDto dto= new MemberDto();
		dto.setName(request.getParameter("name"));
		dto.setHp(request.getParameter("hp"));
		  // 체크박스 or 라디오 값이 null일 경우를 대비한 처리
	    // driver 값이 null이면 "없음", 아니면 "있음"
		dto.setDriver(request.getParameter("driver")=="null"? "있음": "없음");
		dto.setJop(request.getParameter("job"));
		 // PK(num)은 반드시 있어야 어떤 회원을 수정할지 특정할 수 있다
		dto.setNum(request.getParameter("num"));
		

	    // ★★ DAO 호출하여 DB 데이터 업데이트 ★★
		MemberDao dao= new MemberDao();
		dao.updateMember(dto);
		

	    // 수정 후 리스트 페이지로 이동
		response.sendRedirect("memberlist.jsp");
		
	%>
	 <!-- 자바빈즈로 변경해보자 -->
	 <%-- <%
	   request.setCharacterEncoding("utf-8");
	 %>
	 <!-- useBean은 new로 객체생성하는것과 같다 -->
	 <jsp:useBean id="dao" class="member.MemberDao"/>
	 <jsp:useBean id="dto" class="member.MemberDto"/>
	 <jsp:setProperty property="*" name="dto"/>
	 
	 <%
	 	
	  	response.sendRedirect("memberlist.jsp");
	 %> --%>

	
	

</body>
</html>