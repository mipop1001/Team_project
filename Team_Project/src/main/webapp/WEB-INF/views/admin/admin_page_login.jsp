<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="admin_login_check" method="post">
		<table align="center">
		<caption>관리자 로그인</caption>
			<tr>
				<th>아이디</th>
				<td> <hr> <input type="text" name="login_id"> </td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td> <hr> <input type="password" name="login_pw"> </td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>