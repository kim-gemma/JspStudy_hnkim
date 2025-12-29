<%@page import="java.util.Enumeration"%>
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
  //업로드할 경로
  String realFolder=getServletContext().getRealPath("/photo");
	System.out.println(realFolder);
  //업로드 허용할 크기
  int uploadSize=1024*1024*5; //5mb
  
  MultipartRequest multi=null;
  
  try{
  multi=new MultipartRequest(request,realFolder,uploadSize,"utf-8",
		  new DefaultFileRenamePolicy());
  
    //입력할 값들 읽어오기
    String writer=multi.getParameter("writer");
    
    //파일타입이 여러개인경우
    Enumeration forNames=multi.getFileNames(); //file타입만
    
    
    while(forNames.hasMoreElements())
    {
    	//파일태그의 name을 얻기
    	String fileName=(String)forNames.nextElement();
    	System.out.println("file type의 name: "+fileName);
    	
    	//실제업로드된 파일명
    	String uploadFileName=multi.getFilesystemName(fileName);
    	System.out.println("file type의 name: "+uploadFileName);
    	
    	//파일선택안하면 null
    	if(uploadFileName!=null){%>
    		
    		<figure>
    		  <img alt="" src="../photo/<%=uploadFileName%>"
    		  style="width: 200px;">
    		  
    		  <figcaption><b><%=uploadFileName %></b></figcaption>
    		</figure>
    		
    		
    	<%}
    }
  
  }catch(Exception e){
	   e.printStackTrace();
  }
%>
</body>
</html>