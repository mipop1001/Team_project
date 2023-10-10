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
<table align="center">
<c:choose>
<c:when test="${loginstate==true }">
<h2>주문 내역 확인 list</h2>
<tr>
<th>상품번호</th>
<th>상품명</th>
<th></th>
<th></th>
</tr>

<tr>

</tr>
</c:when>

<c:otherwise>
<h2>판매자 메인 페이지!</h2>
</c:otherwise>
</c:choose>
</table>
</body>
</html>