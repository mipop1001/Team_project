<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.login_btn {
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
	width: 125px; 
	&: hover { background : rgb( 77, 77, 77);
	color: #fff; }
}
.fpw_btn {
	width: 120px; margin-left : 20px;
	height: 52px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
	margin-left: 20px;}
}
.table_find {
	margin-bottom: 50px;
	align-items: center;
}
th{
width: 136.38px;
}
td {

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
				<td><h2>아이디는<span style="color: red"> ${i.seller_id } </span>입니다.</h2></td>
			</tr>
			<tr>
				<td align="center">
				<hr>
				<input type="button" onclick="location.href='seller_login'" class="login_btn" value="로그인 하러 가기" align="center">
				<input type="button" onclick="location.href='seller_login_find_password'" class="fpw_btn" value="비밀번호 찾기" align="center">
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>