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
<table border="2" align="center">
<c:forEach items="${list }" var="community_detail">
<tr><td align="right" colspan="5">
<input type="button" value="수정" onclick="location.href='customer_community_modify_get?community_board_number=${community_detail.community_board_number}'">
<input type="button" value="삭제" onclick="location.href='customer_community_delete?community_board_number=${community_detail.community_board_number}'">
</td></tr>
<tr><th>제목</th><td colspan="4">${community_detail.community_board_title }</td></tr>
<tr><th>작성자</th><td colspan="4"> db생성 및 출력 기능 추가 필요</td></tr>
<tr><th>작성일자</th><td colspan="4">${community_detail.community_board_date }</td></tr>
<tr><th>지역</th><td colspan="2">${community_detail.community_board_location }</td>
<th>별점</th><td>${community_detail.community_board_grade }</td></tr>
<tr><th>내용</th><td colspan="4">${community_detail.community_board_content }</td></tr>
<tr><th>이미지</th><br>
<td><img src="product_sum_image/${community_detail.community_board_sum_image }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image1 }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image2 }"></td>
<td><img src="product_intro_image/${community_detail.community_board_detail_image3 }"></td></tr>
</c:forEach>
</table>
<hr>
	<h4>댓글</h4>
	<div id="review" style="box-sizing: 50"></div>
	


</body>
</html>