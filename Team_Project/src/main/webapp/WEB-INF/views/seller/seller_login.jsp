<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		let message = "${msg}";
		if (message.trim() !== "") {
			alert(message);
		}
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<form action="seller_login_save" method="post">
		<table align="center">
		<caption>판매자 로그인</caption>
			<tr>
				<th>아이디</th>
				<td><hr><input type="text" name="seller_id"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><hr><input type="password" name="seller_password"></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="submit" value="로그인">
					<input type="button" onclick="location.href='seller_join'" value="회원가입">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<a href="seller_login_find_id">아이디 찾기</a>/<a href="seller_login_find_password">비밀번호 찾기</a>
				</td>
		</table>
	</form>
</body>
</html>