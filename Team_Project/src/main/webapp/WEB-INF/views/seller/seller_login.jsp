<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.title {
    text-align: center;
    width: 100%;
}
.login_btn{
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
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}	
.seller_join_btn{
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
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
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

</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(document).ready(function() {
		let message = "${msg}";
		if (message.trim() !== "") {
			alert(message);
		}
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<hr>
	<form action="seller_login_save" method="post">
		<table align="center">
		<caption class="title">판매자 로그인</caption>
			<tr>
				<th>아이디</th>
				<td><hr><input type="text" name="seller_id" placeholder="아이디"></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><hr><input type="password" name="seller_password" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="submit" class="login_btn" value="로그인">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
					<input type="button" class="seller_join_btn" onclick="location.href='seller_join'" value="회원가입">
				</td>
			</tr>
			<tr>
		</table>
			<div class="find_wall">
				<div class="find_id">
					<a href="seller_login_find_id">아이디 찾기</a>
				</div>
				<div class="find_pw">
					<a href="seller_login_find_password">비밀번호 찾기</a>
				</div>
			</div>
	</form>
</body>
</html>