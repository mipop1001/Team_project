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
		<c:forEach items="${list}" var="a">
		    <tr>
		        <th>
		            <h2>${a.member_name}님의 가입하신 <span style="color: red">${a.member_id}</span>의 패스워드는 
		                <span style="color: red">${a.member_password}</span> 입니다.
		            </h2>
		        </th>
		    </tr>
		</c:forEach>
	</table>
	<hr>
	<form action="customer_login_check" method="get">
		<table align="center">
			<tr>
				<th>아이디</th>
				<td> <input type="text" name="login_id"> </td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td> <input type="text" name="login_pw"> </td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='customer_join';">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <a href="customer_find_id">아이디 찾기</a>/<a href="customer_find_pw">비밀번호 찾기</a></td>
			</tr>
		</table>
	</form>
</body>
</html>