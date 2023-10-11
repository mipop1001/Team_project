<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	<form action="seller_login_find_password_save" method="post">
		<table align="center">

			<tr>
				<th>아이디</th>
				<td><hr><input type="text" name="seller_id"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><hr><input type="text" name="seller_email"></td>
			</tr>
			<tr>
			<hr>
				<td colspan="2">
				<hr>
					<input type="submit" value="비밀번호 찾기">
					<input type="button" value="취소" onclick="location.href='seller_login'">
				</td>
			</tr>
			<tr>
		</table>
	</form>
</body>
</html>