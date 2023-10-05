<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="seller_info_modify_update" method="post">
<c:forEach items="${list }" var="i">
<table align="center">
<h2>마이페이지</h2>
<tr>
<th>아이디</th>
<td>${i.seller_id }</td>
</tr>
<input type="hidden" name="seller_number" value="${i.seller_number }">
<tr>
<th>비밀번호</th>
<td><input type="text" name="seller_password" value="${i.seller_password }"></td>
</tr>

<tr>
<th>이름</th>
<td>${i.seller_name }</td>
</tr>

<tr>
<th>전화번호</th>
<td><input type="text" name="seller_phone_number" value="${i.seller_phone_number }"></td>
</tr>

<tr>
<th>이메일</th>
<td>${i.seller_email }</td>
</tr>

<tr>
<th>사업자 번호</th>
<td><input type="text" name="seller_company_number" value="${i.seller_company_number }"></td>
</tr>

<tr>
<th>사업장 주소</th>
<td><input type="text" name="seller_company_address" value="${i.seller_company_address }"></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="수정"></td>
</tr>
</table>
</c:forEach>
</form>

</body>
</html>