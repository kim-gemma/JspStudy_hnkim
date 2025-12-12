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
<form action="ex5_action.jsp" method="post">
     <table class="table table-bordered" style="width: 700px;">
        <tr>
          <th width="100" class="table-warning">사원명</th>
          <td>
             <input type="text" name="s_name" class="form-control"
             style="width: 120px;">
          </td>
        </tr>
        <tr>
          <th width="100" class="table-warning">해외근무여부</th>
          <td>
             <input type="checkbox" name="cbArea">가능
             
          </td>
        </tr>
        <tr>
          <th width="100" class="table-warning">입사일자</th>
          <td>
             <input type="date" name="ipsaday" class="form-control"
             style="width: 150px;">
          </td>
        </tr>
        <tr>
          <th width="130" class="table-warning">가장좋았던 점심메뉴(택1)</th>
          <td>
             <input type="radio" name="menu" value="1" checked="checked">에그샌드위치&nbsp;
             <input type="radio" name="menu" value="2">꼬치구이&nbsp;
             <input type="radio" name="menu" value="7">토마토덮밥&nbsp;
             <input type="radio" name="menu" value="10">햄에그덮밥&nbsp;
             <input type="radio" name="menu" value="11">치즈라면&nbsp;
          </td>
        </tr>
        <tr>
          <th width="100" class="table-warning">가능언어</th>
          <td>
             <input type="checkbox" name="lang" value="영어">영어&nbsp;
             <input type="checkbox" name="lang" value="프랑스어">프랑스어&nbsp;
             <input type="checkbox" name="lang" value="중국어">중국어&nbsp;
             <input type="checkbox" name="lang" value="일본어">일본어&nbsp;
             <input type="checkbox" name="lang" value="베트남어">베트남어&nbsp;
          </td>
        </tr>
        <tr>
          <th>받고싶은 명절선물(택1)</th>
          <td>
            <select name="gift">
                <option value="../image/logoImg/acc01.png">시계</option>
                <option value="../image/logoImg/acc03.png">향수</option>
                <option value="../image/logoImg/icon03.png">게임기</option>
                <option value="../image/jquery_img/money.png">현금</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <th>배경색선택</th>
          <td>
            <input type="color" name="bgColor" value="#ffcccc">
          </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <button type="submit" class="btn btn-success btn-lg">사원 투표 전송</button>
          </td>
        </tr>
     </table>
   </form>
</body>
</html>