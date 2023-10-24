<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.modify_btn {
	height: 30px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 14px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 45px; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}
.delete_btn {
	width: 45px;
	height: 30px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 14px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5; &: hover { background : rgb( 77, 77, 77);
	color: #fff;
}

}
table {
	text-align: center;
	width: 700px;
	height: auto;
}

.page_name {
	color: #777;
	font-size: 30px;
	margin-bottom: 10px;
}

.title_line {
	text-align: center;
}

.info_line {
	padding: 0 10px 0 10px;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<hr>
	<div class="container">
		<table align="center">
			<div class="page_name">내가 작성한 게시글 목록</div>
			<tr>
				<th colspan="6" height="50px" align="left">작성자 :
					${memberDTO.member_name }</th>
			</tr>
			<tr class="title_line">
				<th>제목</th>
				<th>작성일자</th>
				<th>지역</th>
				<th>별점</th>
				<th>썸네일 이미지</th>
			</tr>
			<c:forEach items="${list }" var="a">
				<tr class="info_line">
					<td><a
						href="customer_community_detail?community_board_number=${a.community_board_number }">${a.community_board_title }</a></td>
					<td>${a.community_board_date }</td>
					<td>${a.community_board_location }</td>
					<td>${a.community_board_grade }</td>
					<td><img alt="썸네일 이미지"
						src="product_sum_image/${a.community_board_sum_image }"
						width="100px" height="50px"></td>
					<td><input type="button" value="수정" class="modify_btn"
						onclick="location.href='customer_community_modify_get?community_board_number=${a.community_board_number}'">
						<input type="button" value="삭제" class="delete_btn"
						onclick="location.href='customer_community_delete?community_board_number=${a.community_board_number}'">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr>
</body>
</html>