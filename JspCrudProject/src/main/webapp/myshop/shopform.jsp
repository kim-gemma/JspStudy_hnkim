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
<script type="text/javascript">
$(function () {
	
	//select의 첫이미지와 맞추기
	var selImg = $("#photo").val();

	//작은이미지에 src에 넣어준다
	$("#myphoto").attr(
	  "src",
	  "<%=request.getContextPath()%>/image/쇼핑몰사진/" + selImg + ".jpg"
	);

	
	//사진을 선택하면 옆의 이미지에 사진이 나오게
    $("#photo").on("change", function () {
        let selectedValue = $(this).val();
        let newImageSrc =
            "<%=request.getContextPath()%>/image/쇼핑몰사진/" 
            + selectedValue + ".jpg";

        $("#myphoto").attr("src", newImageSrc);
    });
	
	
	//$("#photo").chage(function() {
	//	var s="../image/쇼핑몰사진"+$(this).val()+".jpg";
		//$("#myphoto").attr("src",s);
	//});
});



</script>
</head>

<body>

<div style="margin: 50px 100px; width: 500px;">
	<form action="addproc.jsp" method="post">
		<table class="table table-bordered">
		<caption align="top"><a>상품입고등록</a></caption>
			<tr>
				<th width="80" class="table-secondary">상품명</th>
				<td>
					<input type="text" name="sangpum" required="required"
					class="form-control" style="width: 200px">
				</td>
			</tr>
			<tr>
				<th width="100" class="table-secondary">상품이미지</th>
				<td class="input-group">
					<select name="photo" class="form-control" id="photo">
						<option value="30">헤어밴드#1</option>
						<option value="11">단화#1</option>
						<option value="12">단화#2</option>
						<option value="13">단화#3</option>
						<option value="20">팔찌</option>
						<option value="21">반지</option>
						<option value="33">원피스</option>
						<option value="34">반바지</option>
						<option value="35">모자#1</option>
						<option value="29">모자#2</option>
						<option value="2">모자#3</option>
						<option value="3">모자#4</option>
					</select>
					&nbsp;&nbsp;&nbsp;
					<img alt="" src="" width="30" height="30" id="myphoto">
				</td>
			</tr>
			<tr>
				<th width="80" class="table-secondary">가격</th>
				<td>
				<!--정규패턴[0-9] → 숫자 0부터 9{3,} → 3자리 이상-->
					<input type="number" name="price" required="required"
					class="form-control" style="width: 200px" pattern="[0~9]{3,}">
				</td>
			</tr>

			<tr>
				<th width="80" class="table-secondary">입고일자</th>
				<td>
					<input type="date" name="ipgoday" required="required"
					class="form-control" style="width: 200px" value="<%= java.time.LocalDate.now() %>">
				</td>
			</tr>
		 	<tr>
	           <td colspan="2" align="center">
	             <button type="submit" class="btn btn-info">상품저장</button>
	             <button type="button" class="btn btn-success"
	             onclick="location.href='shoplist.jsp'">상품목록</button>
	           </td>
	         </tr>
		</table>
	</form>
</div>

</body>
</html>