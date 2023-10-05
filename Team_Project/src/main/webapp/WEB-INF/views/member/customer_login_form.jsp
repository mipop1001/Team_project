<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
$(document).ready(function() {
    let message = "${msg}";
    if (message.trim() !== "") {
        alert(message);
    }
});
</script>
<body>
<hr>
	<form action="customer_login_check" method="get">
		<table align="center">
		<caption>사용자 로그인</caption>
			<tr>
				<th>아이디</th>
				<td> <hr> <input type="text" name="login_id"> </td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td> <hr> <input type="text" name="login_pw"> </td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='customer_join';">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"> <hr> <a href="customer_find_id">아이디 찾기</a>/<a href="customer_find_pw">비밀번호 찾기</a></td>
			</tr>
		</table>
	</form>

</body>
</html>