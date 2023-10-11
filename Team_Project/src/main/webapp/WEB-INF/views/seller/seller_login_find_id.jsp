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
	<form action="seller_login_find_id_save" method="post">
		<table align="center">
			<tr>
				<th>이름</th>
				<td><hr><input type="text" name="seller_name">
				<td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><hr><input type="text" name="seller_email"></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="submit" value="아이디 찾기">
					<input type="button" value="취소" onclick="location.href='seller_login'">
				</td>
			</tr>
			<tr>
		</table>
	</form>
</body>
</html>