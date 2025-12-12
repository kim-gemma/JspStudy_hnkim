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
   <!--  폼으로 quizAction에 전송후 action페이지에서 처리할것!!!
   1. 본인 이름입력 (text)  2.오늘점심메뉴(radio) 3.가능IT언어(check 다중)-->
   <form action="quizAction.jsp" method="post">
     <table class="table table-bordered" style="width: 700px;">
        <tr>
          <th width="100" class="table-warning">이름</th>
          <td>
             <input type="text" name="irum" class="form-control"
             style="width: 120px;">
          </td>
        </tr>
        <tr>
          <th width="130" class="table-warning">오늘 점심메뉴</th>
          <td>
             <input type="radio" name="menu" value="../image/Food/1.jpg" checked="checked">에그샌드위치&nbsp;
             <input type="radio" name="menu" value="../image/Food/2.jpg">꼬치구이&nbsp;
             <input type="radio" name="menu" value="../image/Food/8.jpg">토마토덮밥&nbsp;
             <input type="radio" name="menu" value="../image/Food/10.jpg">햄에그덮밥&nbsp;
             <input type="radio" name="menu" value="../image/Food/11.jpg">치즈라면&nbsp;
          </td>
        </tr>
        <tr>
          <th width="100" class="table-warning">가능 IT언어</th>
          <td>
             <input type="checkbox" name="lang" value="Java">자바&nbsp;
             <input type="checkbox" name="lang" value="Oracle">오라클&nbsp;
             <input type="checkbox" name="lang" value="JQuery">제이쿼리&nbsp;
             <input type="checkbox" name="lang" value="Spring">스프링&nbsp;
             <input type="checkbox" name="lang" value="JavaScript">자바스크립트&nbsp;
          </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <button type="submit" class="btn btn-success btn-lg">정보 전송</button>
          </td>
        </tr>
     </table>
   </form>
</body>
</html>