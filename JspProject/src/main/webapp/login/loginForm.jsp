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
<div style="margin: 200px 200px; width: 400px;">
    <h2>회원로그인</h2>
    <form action="loginAction.jsp" method="post">
       <input type="text" name="id" class="form-control"
       style="width: 200px;" placeholder="로그인할 아이디"
       required="required">
       <br>
       <input type="text" name="pass" class="form-control"
       style="width: 200px;" placeholder="로그인할 비밀번호"
       required="required">
       <br>
       <button type="submit" class="btn btn-success"
       style="width: 200px;">로그인</button>
       <br>
       <input type="checkbox" name="save">아이디저장
    </form>
</div>
</body>
</html>