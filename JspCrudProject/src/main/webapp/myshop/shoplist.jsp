<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myshop.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="myshop.ShopDao"%>
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
	ShopDao dao = new ShopDao();
	List<ShopDto> list = dao.getAllSangpums();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	NumberFormat nf=NumberFormat.getCurrencyInstance();
	%>
<body>
	<div style="margin: 50px 100px; width: 900px;">
		<h3 class="alert alert-info">Myshop 전체목록 출력</h3>
		<button type="button" class="btn btn-warning" onclick="location.href='shopform.jsp'">
			상품추가
		</button>
		<br>
		 <table class="table table-bordered">
			<tr class="table-warning">
		        <th width="80">번호</th>
		        <th width="280">상품명</th>
		        <th width="180">가격</th>
		        <th width="180">입고날짜</th>
		        <th width="180">등록날짜</th>
		      </tr>
		 	<%
		 	//→ 빈 목록 처리 (매우 중요)
		       if(list.size()==0){%>
		    	   <tr>
		    	     <td colspan="5" align="center">
		    	       <h6>입고된 상품이 없습니다</h6>
		    	     </td>
		    	   </tr>
		       <%}else{
		    	   
		    	   for(int i=0;i<list.size();i++)
		    		   //for + dto = list.get(i) → 한 줄 = DB 한 행
		    	   {
		    		   ShopDto dto=list.get(i);
		    		   %>
		    		   <tr>
		    		     <td align="center"><%=i+1 %></td>
		    		     <td>
		    		     <!-- 링크에 num 넘김→ 상세페이지, 수정, 삭제의 핵심 -->
		    		     <a href="detailpage.jsp?num=<%=dto.getNum()%>"><img alt="" src="../image/쇼핑몰사진/<%=dto.getPhoto()%>.jpg"
		    		     width="50" height="50"></a>
		    		     &nbsp;&nbsp;&nbsp;
		    		     <%=dto.getSangpum() %>
		    		     
		    		     </td>
		    		     <td align="right"><%=nf.format(dto.getPrice()) %></td>
		    		     <td align="center"><%=dto.getIpgoday() %></td>
		    		     <td><%=sdf.format(dto.getWriteday()) %></td>
		    		   </tr>
		    	   <%}
		       }
		      %>
		</table>
	</div>
</body>
</html>