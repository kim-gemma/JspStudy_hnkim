<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
   String realFolder=getServletContext().getRealPath("/save");
   System.out.println(realFolder);
   
   int fileSize=1024*1024*3; //3mb
   
   MultipartRequest multi=null;
   
   try{
   multi=new MultipartRequest(request,realFolder,fileSize,"utf-8",
		   new DefaultFileRenamePolicy());
   
        //폼의 name요청
        String name=multi.getParameter("name");
        String subject=multi.getParameter("subject");
        String uploadFileName=multi.getFilesystemName("uploadFile");
        String originalFileName=multi.getOriginalFileName("uploadFile");
        %>
   
     <div style="width: 400px; border: 1px solid gray; ">
         <h2>이름: <%=name %></h2>
         <h2>제목: <%=subject %></h2>
         <h2>원래파일명 : <%=originalFileName %></h2>
         <img alt="" src="../save/<%=uploadFileName%>" width="300">
         <br><br>
         <button type="button" onclick="location.href='uploadform.jsp'">다시 업로드 하기</button>
     </div>
   
   
   <%}catch(Exception e){
	   e.printStackTrace();
   }
   
%>
</body>
</html>