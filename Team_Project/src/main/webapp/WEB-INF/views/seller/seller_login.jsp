<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="seller_login_save" method="post">
<table align="center">
<tr>
<th>아이디</th>
<td><input type="text" name="seller_id"><td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type="password" name="seller_password"></td>
</tr>
<tr>
<td><input type="submit" value="로그인"></td>
<td><a href="seller_join">회원가입</a></td>
</tr>
<tr>
<td><a href="seller_login_find_id">아이디 찾기</a>
<td><a href="seller_login_find_password">비밀번호 찾기</a>
</table>
</form>
</body>
</html>