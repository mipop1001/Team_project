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
	width: 125px; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}
.fpw_btn {
	width: 120px;
	margin-left: 20px;
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
	margin-left: 20px;
}
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center">
		<c:forEach items="${list}" var="a">
			<tr>
				<th>
					<h2>${a.member_name}님의
						가입하신 아이디는 <span style="color: red">${a.member_id}</span> 입니다.
					</h2>
				</th>
			</tr>
		</c:forEach>
	</table>
	<hr>
	<form action="customer_login_check" method="get">
		<table align="center">
			<tr>
				<th>아이디</th>
				<td><hr> <input type="text" name="login_id"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><hr> <input type="text" name="login_pw"><hr></td>
			</tr>
			<td align="center" colspan="2">
			<input type="submit" class="login_btn" value="로그인"> 
			<input type="button" onclick="location.href='customer_find_id'"
				class="fpw_btn" value="아이디 찾기" align="center"> 
				<input
				type="button" onclick="location.href='customer_find_pw'"
				class="fpw_btn" value="비밀번호 찾기" align="center"> 
				<input
				type="button" class="fpw_btn" value="회원가입" onclick="location.href='customer_join';">
			</td>
			</tr>
		</table>
	</form>
</body>
</html>