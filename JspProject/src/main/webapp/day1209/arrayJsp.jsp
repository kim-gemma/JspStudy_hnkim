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
   img{
      width: 100px;
      height: 90px;
      border-radius: 20px;
      border: 1px solid gray; 
   }
</style>
</head>
<body>
   <!-- 이미지 가져오기 연습_ 다른폴더-->
   <img alt="" src="../image/Food/1.jpg">
   <!-- 이미지 가져오기 연습_ 같은폴더  ./는 생략가능-->
   <img alt="" src="./01.png"> 
   
   <h4>이미지 배열로 가져오기 연습_배열선언</h4>
   <%
     String [] imgArr={"01","09","a","a01","a06","image_03","money","logo","a03"};
     int n=0; //증가변수
   %>
   
   <table>
      <%
       for(int i=0;i<3;i++)  //행 0,1,2
       {%>
    	   <tr>
    	     <%
    	     for(int j=0;j<3;j++) //열 0,1,2
    	     {%>
    	    	 <td>
    	    	   <img alt="" src="../image/jquery_img/<%=imgArr[n]%>.png">
    	    	 </td>
    	     <%
    	      n++;
    	     }
    	     %>
    	   </tr>
       <%}
      %>
   </table>
   
   
   <h4>이미지 배열로 가져오기 연습_<br>배열선언없이 (Food,연예인사진처럼 일련번호인것)
   4행5열(4행3열)</h4>
   
   <table>
     <%
       int a=0;
     
       for(int row=1;row<=4;row++)  //행
       {%>
    	  <tr>
    	     <%
    	       for(int col=1;col<=5;col++) //열
    	       {
    	         a++;
    	       %>
    	    	   <td>
    	    	     <img alt="" src="../image/연예인사진/<%=a%>.jpg">
    	    	   </td>
    	       <%}
    	     %>
    	  </tr>
       <%}
     %>
   
   </table>
   
   <h4>쇼핑몰 사진의 1~20개를 4행5열로 출력해 보세요</h4>
   
   <div>
       <%
         for(int i=1;i<=20;i++)
         {%>
        	 <img alt="" src="../image/쇼핑몰사진/<%=i%>.jpg">
        	 
        	 <%
        	   if(i%5==0){%>
        		   <br>
        	   <%}
        	 %>
         <%}
       %>
   </div>
</body>
</html>