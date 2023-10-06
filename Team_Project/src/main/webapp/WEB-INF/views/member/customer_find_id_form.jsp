<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<form action="customer_id_search" method="get">
		<table align="center">
		
			<tr>
				<th>이름</th>
				<td><hr> <input type="text" name="member_name"> </td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><hr> <input type="email" name="member_email"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<hr>
					<input type="submit" value="아이디 찾기">
					<input type="button" value="취소" onclick="location.href='customer_login'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>