<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="seller_join_save" method="post">
<table align="center">
<tr>
<h2>회원가입</h2>
</tr>
<tr>
<th>아이디</th>
<td><input type="text" name="seller_id"></td>
</tr>

<tr>
<th>비밀번호</th>
<td><input type="text" name="seller_password"></td>
</tr>

<tr>
<th>이름</th>
<td><input type="text" name="seller_name"></td>
</tr>

<tr>
<th>전화번호</th>
<td><input type="text" name="seller_phone_number"></td>
</tr>

<tr>
<th>이메일</th>
<td><input type="text" name="seller_email"></td>
</tr>

<tr>
<th>사업자번호</th>
<td><input type="text" name="seller_company_number"></td>
</tr>

<tr>
<th>사업자주소</th>
<td><input type="text" name="seller_company_address"></td>
</tr>

<tr>
<td colspan="2"><input type="submit" value="회원가입"></td>
</tr>
</table>
</form>
</body>
</html>