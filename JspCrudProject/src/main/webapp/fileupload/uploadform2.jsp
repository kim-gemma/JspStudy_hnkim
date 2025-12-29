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
	<form action="uploadaction2.jsp" method="post" enctype="multipart/form-data">
		<table>
			<caption align="top"><b>여러개 이미지 업로드</b></caption>
			<tr>
				<th width="100" class="table-secondary">작성자</th>
				<td>
					<input type="text" name="writer" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">이미지</th>
				<td>
					<input type="file" name="photo1" class="form-control">
					<input type="file" name="photo2" class="form-control">
					<input type="file" name="photo3" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-danger">서버 전송 버튼</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>