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
<!-- 
파일 업로드가 포함된 form일 경우 반드시 아래 두 가지가 필요
1. method="post"
2. enctype="multipart/form-data"
-->

<!-- 
파일 업로드가 하나라도 있으면
request.getParameter()로 값 받으면 안 되고,
MultipartRequest 객체를 생성해서 데이터를 처리해야 함
(uploadproc.jsp에서 처리)
-->
	<form action="uploadproc.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name" style="width: 120px;">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject" style="width: 120px;">
			</td>
		</tr>
		<tr>
			<th>이미지</th>
			<td>
				<input type="file" name="uploadfile" style="width: 300px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-success">서버에 업로드</button>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>