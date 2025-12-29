<%@page import="simpleboard.BoardDao"%>
<%@page import="simpleboard.BoardDto"%>
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
   //엔코딩
   request.setCharacterEncoding("utf-8");
  
    //업로드에 필요한변수 1.경로  2.크기
   String realPath=getServletContext().getRealPath("/save");
   System.out.println(realPath);
   
   int uploadSize=1024*1024*5; //5mb
   
   try{
   MultipartRequest multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
		   new  DefaultFileRenamePolicy());
   
      //입력값 읽기
      String num=multi.getParameter("num");
      String writer=multi.getParameter("writer");
      String subject=multi.getParameter("subject");
      String content=multi.getParameter("content");
      String pass=multi.getParameter("pass");
      
      //실제 업로드된 이미지이름 읽어오기
      String photo=multi.getFilesystemName("photo");
      
      //dto에 담기
      BoardDto dto=new BoardDto();
      
      dto.setNum(num);
      dto.setWriter(writer);
      dto.setSubject(subject);
      dto.setContent(content);
      dto.setImgname(photo);
      dto.setPass(pass);
      
      //dao
      BoardDao dao=new BoardDao();
      
      //비번이 맞으면 수정후 디테일페이지로 이동
      //비번이 틀리면 스크립트로 경고창날림!!!
      boolean b=dao.isEqualPass(num, pass);
      
      if(b)
      {
    	  //맞는경우
    	  dao.updateBoard(dto);//수정이 된다
    	  
    	  //이동
    	  response.sendRedirect("detailView.jsp?num="+num);
      }else{
    	  //비번틀린경우
    	  %>
    	  <script type="text/javascript">
    	   alert("비밀번호가 틀렸어요~~!!!");
    	   history.back();
    	  </script>
      <%}
      
      
      
   
   }catch(Exception e){
	   
   }
  %>
  
</body>
</html>