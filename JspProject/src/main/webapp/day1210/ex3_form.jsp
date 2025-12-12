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
   <h2>여러데이타 전송하기_get,post</h2>
   <form action="ex3_action.jsp" method="post">
      <table class="table table-striped" style="width: 300px;">
         <tr>
           <th>이름</th>
           <td>
               <input type="text" name="name" style="width: 100px;"
               placeholder="이름입력" required="required"
               class="form-control">
           </td>
        </tr>
        <tr>
           <th>비밀번호</th>
           <td>
               <input type="password" name="pass" style="width: 120px;"
               placeholder="비밀번호입력" required="required"
               class="form-control">
           </td>
        </tr>
        <tr>
           <th>운전면허</th>
           <td>
               <input type="checkbox" name="driverlic"> 운전면허
           </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
            <input type="submit" value="전송" class="btn btn-outline-success"
            style="width: 100px;">
          </td>
        </tr>
      </table>
   </form>
</body>
</html>