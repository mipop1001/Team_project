<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">관리자 페이지</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="user_list">사용자 목록 보기</a></li>
				<li><a href="seller_list">판매자 목록 보기</a></li>
				<li><a href="board_list">게시글 목록 보기</a></li>
				<li><a href="product_list">상품 목록 보기</a></li>
			</ul>
		</div>
	</nav>
	<hr>
	<table border="1" align="center" width="1800px">
		<tr>
			<th>사용자 번호</th>
			<th>사용자 아이디</th>
			<th>사용자 패스워드</th>
			<th>사용자 이름</th>
			<th>사용자 주민번호</th>
			<th>사용자 나이</th>
			<th>사용자 성별</th>
			<th>사용자 전화번호</th>
			<th>사용자 주소</th>
			<th>사용자 이메일</th>
			<th>사용자 생일</th>
			<th>사용자 보유 포인트</th>
			<th>사용자 사용 포인트</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${userlist }" var="user">
			<tr>
				<td>${user.member_number }</td>
				<td>${user.member_id }</td>
				<td>${user.member_password }</td>
				<td>${user.member_name }</td>
				<td>${user.member_personal_number }</td>
				<td>${user.member_age }</td>
				<td>${user.member_gender }</td>
				<td>${user.member_phone_number }</td>
				<td>${user.member_address }</td>
				<td>${user.member_email }</td>
				<td>${user.member_birthday }</td>
				<td>${user.member_point }</td>
				<td>${user.member_buy }</td>
				<td> <a href="user_list_delete?member_number=${user.member_number }">삭제</a> </td>
			</tr>
		</c:forEach>
	</table>
	<hr>
		<table border="1" align="center" width="1800px">
		<tr>
			<th>판매자 번호</th>
			<th>판매자 아이디</th>
			<th>판매자 패스워드</th>
			<th>판매자 이름</th>
			<th>판매자 전화번호</th>
			<th>판매자 이메일</th>
			<th>판매자 사업장 번호</th>
			<th>판매자 사업장 주소</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${sellerlist }" var="seller">
			<tr>
				<td>${seller.seller_number }</td>
				<td>${seller.seller_id }</td>
				<td>${seller.seller_password }</td>
				<td>${seller.seller_name }</td>
				<td>${seller.seller_phone_number }</td>
				<td>${seller.seller_email }</td>
				<td>${seller.seller_company_number }</td>
				<td>${seller.seller_company_address }</td>
				<td> <a href="seller_list_delete?seller_number=${seller.seller_number }">삭제</a> </td>
			</tr>
		</c:forEach>
	</table>
	<hr>
		<table border="1" align="center" width="1800px">
		<tr>
			<th>게시글 번호</th>
			<th>게시글 제목</th>
			<th>게시글 내용</th>
			<th>게시글 작성날짜</th>
			<th>게시글 지역</th>
			<th>게시글 별 등급</th>
			<th>게시글 메인 이미지</th>
			<th>게시글 서브 이미지1</th>
			<th>게시글 서브 이미지2</th>
			<th>게시글 서브 이미지3</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${board_list }" var="board">
			<tr>
				<td>${board.community_board_number }</td>
				<td>${board.community_board_title }</td>
				<td>${board.community_board_content }</td>
				<td>${board.community_board_date }</td>
				<td>${board.community_board_location }</td>
				<td>${board.community_board_grade }</td>
				<td>${board.community_board_sum_image }</td>
				<td>${board.community_board_detail_image1 }</td>
				<td>${board.community_board_detail_image2 }</td>
				<td>${board.community_board_detail_image3 }</td>
				<td> <a href="board_list_delete?community_board_number=${board.community_board_number }">삭제</a> </td>
			</tr>
		</c:forEach>
	</table>
	<hr>
		<table border="1" align="center" width="1800px">
		<tr>
			<th>상품 번호</th>
			<th>상품명</th>
			<th>상품 생산 지역</th>
			<th>상품 메이커</th>
			<th>상품 가격</th>
			<th>상품 등록 수량</th>
			<th>상품 판매 수량</th>
			<th>상품 대표 이미지</th>
			<th>상품 서브 이미지1</th>
			<th>상품 서브 이미지2</th>
			<th>상품 서브 이미지3</th>
			<th>비고</th>
		</tr>
		<c:forEach items="${product_list }" var="product">
			<tr>
				<td>${product.product_number }</td>
				<td>${product.product_name }</td>
				<td>${product.product_country }</td>
				<td>${product.product_maker }</td>
				<td>${product.product_price }</td>
				<td>${product.product_sell_amount }</td>
				<td>${product.product_buy_amount }</td>
				<td>${product.product_sum_image }</td>
				<td>${product.product_detail_image1 }</td>
				<td>${product.product_detail_image2 }</td>
				<td>${product.product_detail_image3 }</td>
				<td> <a href="product_list_delete?product_number=${product.product_number }">삭제</a> </td>
			</tr>
		</c:forEach>
	</table>
<hr>
</body>
</html>