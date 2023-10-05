<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="customer_pw_search" method="get">
		<table align="center">
			<tr>
				<th>아이디</th>
				<td> <input type="text" name="member_id"> </td>
			</tr>
			<tr>
				<th>이름</th>
				<td> <input type="text" name="member_name"> </td>
			</tr>
			<tr>
				<th>이메일</th>
				<td> <input type="email" name="member_email"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="패스워드 찾기">
					<input type="button" value="취소" onclick="location.href='customer_login'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>