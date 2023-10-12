<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<table border="1" align="center" width="1200px">
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
				<td>${a.community_board_title }</td>
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
	<hr>
</body>
</html>