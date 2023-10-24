<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.submit_btn {
	height: 52px;
	margin: 10px 0 0;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 100px; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}
.reset_btn {
	width: 100px;
	margin-left: 20px;
	height: 52px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
	margin-left: 20px;
}

}
.table_find {
	margin-bottom: 50px;
	align-items: center;
}

th {
	width: 136.38px;
}

td {
	
}

.page_name {
	color: #777;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<form action="customer_id_search" method="get">
		<table align="center" class="table_find">
			<div class="page_name" align="center">아이디 찾기</div>
			<tr>
				<th>이름</th>
				<td><hr> <input type="text" name="member_name"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><hr> <input type="email" name="member_email">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<hr> <input type="submit" class="submit_btn" value="아이디 찾기">
					<input type="button" class="reset_btn" value="취소"
					onclick="location.href='customer_login'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>