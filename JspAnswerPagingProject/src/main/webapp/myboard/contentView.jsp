<%@page import="java.text.SimpleDateFormat"%>
<%@page import="myboard.BoardDto"%>
<%@page import="myboard.BoardDao"%>
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
  body *{
    font-family: 'Nanum Myeongjo';
  }

</style>
<script type="text/javascript">
	$(function () {
		list();
			//alert(num);
			var num = $("#num").val();
			//댓글의 insert
			$("#btnSend").click(function() {
			  
				var nickname=$("#nickname").val();
				var comment=$("#comment").val();
				
				//AJAX 방식에서는 submit 이벤트가 발생하지 않으므로 입력값 검증을 JavaScript에서 직접 처리해야 한다
				if(nickname==''){
					alert("닉네임을 입력하세요");
					return;
				}
				
				if(comment==''){
					alert("댓글 입력하세요");
					return;
				}
				
				
				$.ajax({
					type:"post",
					dataType:"html", // 서버에서 JSON 등을 반환하지 않고 단순 처리만 하므로 html 타입 사용
					url: "../myboardanswer/insertAnswer.jsp",
				    data: {
			            "num": num,
			            "nickname": nickname,
			            "comment": comment
			        },
					success:function(){
						//alert("인서트성공");
						//입력초기화
						$("#nickname").val('');
						$("#comment").val('');
					}				
				})
				
				list();
			});
			
	});
	
	function list(){
		var num=$("#num").val();
		//alert(num);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"../myboardanswer/listAnswer.jsp",
			 data: {
		            "num": num,
		        },
			success:function(res){
				//alert(res.length);
				//댓글갯수 출력
				$("b.acount>span").text(res.length);
				var s="";
				$.each(res,function(idx,ele){
					s += "<div>";
					s += "<i class='bi bi-person-bounding-box'></i> ";
					s += ele.nickname + " : " + ele.comment;
					s += "<span class='aday'>" + ele.writeday + "</span>";
					s += "<i class='bi bi-pencil-fill'></i>";
					s += "<i class='bi bi-trash'></i>";
					s += "</div>";
					
				});
			$("div.alist").html(s);
			}
		})
	}
</script>
</head>
<%
  String num=request.getParameter("num");
  BoardDao dao=new BoardDao();
  BoardDto dto=dao.getData(num);
  //조회수증가
  dao.updateReadCount(num);
  //날짜
  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>

<input type="hidden" id="num" value="<%=num%>" >

<div style="margin: 50px 100px; width: 500px;">
   <table class="table table-bordered">
      <caption align="top"><b style="font-size: 1.2em;"><%=dto.getSubject() %></b></caption>
       <tr>
         <td>
            <b>작성자: <%=dto.getWriter() %></b><br>
            <span><%=dto.getWriteday() %></span> &nbsp;&nbsp;
            <span>조회: <%=dto.getReadcount() %></span>
         </td>
       </tr>
       <tr height="200">
         <td>
           <%=dto.getContent().replace("\n", "<br>") %>
         </td>
       </tr>
       <!-- 댓글 -->
       <tr>
       	<td>
       		<b class="acount">댓글<span>0</span></b>
       		<div class="alist">댓글목록</div>
       		<div class="aform input-group">
       			<input type="text" id="nickname" class="form-control" style="width: 120px;" placeholder="닉네임">&nbsp;&nbsp;
       			<input type="text" id="comment" class="form-control" style="width: 250px;" placeholder="댓글을 입력하세요">&nbsp;&nbsp;
       			<button type="button" id="btnSend" class="btn btn-info">저장</button>
       		</div>
       	</td>
       </tr>
       
       <tr>
         <td align="right">
           <button type="button" class="btn btn-outline-primary" onclick="location.href='insertForm.jsp'">글쓰기</button>
           <button type="button" class="btn btn-outline-secondary" 
           onclick="location.href='updatePassForm.jsp?num=<%=dto.getNum()%>'">수정</button>
           <button type="button" class="btn btn-outline-success" 
           onclick="location.href='deletePassForm.jsp?num=<%=dto.getNum()%>'">삭제</button>
           <button type="button" class="btn btn-secondary" onclick="location.href='boardList.jsp'">목록</button>
         </td>
       </tr>
   </table>
</div>
</body>
</html>