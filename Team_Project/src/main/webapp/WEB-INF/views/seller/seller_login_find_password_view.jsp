<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back_btn {
	height: 52px;
	margin: 10px 0 0;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 315px; 
	&: hover { background : rgb( 77, 77, 77);
	color: #fff; }
}
.table_find {
	margin-bottom: 50px;
	align-items: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<c:forEach items="${list}" var="i">
		<table align="center" class="table_find">
			<tr>
				<td><h2>비밀번호는 <span style="color: red">${i.seller_password } </span>입니다.</h2></td>
			</tr>
			<tr>
				<td><hr><input type="button" onclick="location.href='seller_login'" class="back_btn" value="로그인 하러 가기" align="center"></td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>