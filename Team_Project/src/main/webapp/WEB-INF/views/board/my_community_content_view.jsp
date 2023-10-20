<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
    font-family: 'KOTRA_BOLD-Bold';
}

@font-face {
    font-family: 'KOTRA_BOLD-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<hr>
	<div class="container">
	<table border="1" align="center" width="1200px" class="table table-striped">
		<caption>내가 작성한 게시글 목록</caption>
		<tr>
			<th colspan="6" height="50px">작성자 : ${memberDTO.member_name }</th>
		</tr>
		<tr>
			<th>제목</th>
			<th>작성일자</th>
			<th>지역</th>
			<th>별점</th>
			<th>썸네일 이미지</th>
		</tr>
		<c:forEach items="${list }" var="a">
			<tr>
				<td><a href="customer_community_detail?community_board_number=${a.community_board_number }">${a.community_board_title }</a></td>
				<td>${a.community_board_date }</td>
				<td>${a.community_board_location }</td>
				<td>${a.community_board_grade }</td>
				<td><img alt="썸네일 이미지"
					src="product_sum_image/${a.community_board_sum_image }" width="100px" height="50px"></td>
				<td>
					<input type="button" value="수정" onclick="location.href='customer_community_modify_get?community_board_number=${a.community_board_number}'">
					<input type="button" value="삭제" onclick="location.href='customer_community_delete?community_board_number=${a.community_board_number}'">
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<hr>
</body>
</html>