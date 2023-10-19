<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.login_btn {
	height: 52px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 340px;
}

.member_join_btn {
	height: 52px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 340px;
}

.title {
	text-align: center;
	width: 100%;
}

th {
	bottom: 0;
	position: relative;
}

.find_wall {
	margin-bottom: 0;
	flex-direction: unset;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	padding-bottom: 66px;
	margin-top: 17px;
	-webkit-box-align: center;
	align-items: center;
	font-size: 13px;
	justify-content: center;
}

.find_id {
	border-right: 1px solid #000;
	font-weight: 300;
	padding: 0 18.5px;
}

.find_pw {
	font-weight: 300;
	padding: 0 18.5px;
}
</style>
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
			<caption class="title">사용자 로그인</caption>
			<tr>
				<th>아이디</th>
				<td><hr>
					<input type="text" name="login_id" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><hr>
					<input type="password" name="login_pw" placeholder="비밀번호">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr> <input type="submit" class="login_btn" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<hr> <input type="button" class="member_join_btn" value="회원가입"
					onclick="location.href='customer_join';">
				</td>
			</tr>
		</table>
		<div class="find_wall">
			<div class="find_id">
				<a href="customer_find_id">아이디 찾기</a>
			</div>
			<div class="find_pw">
				<a href="customer_find_pw">비밀번호 찾기</a>
			</div>
		</div>
	</form>

</body>
</html>