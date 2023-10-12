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
<hr>
	<table align="center" width="200px">
	<caption>포인트 관리 페이지</caption>
		<c:forEach items="${list }" var="a">
			<tr>
				<th>아이디 :</th>
				<td><hr>${a.member_name }<hr></td>
			</tr>
			<tr>
				<th>포인트 :</th>
				<td><hr>${a.member_point }<hr></td>
			</tr>
		</c:forEach>
			<tr>
				<td> <hr> <input type="button" value="포인트 충전" onclick="window.open()"> </td>
			</tr>
	</table>
</body>
</html>