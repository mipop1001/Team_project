<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery 추가 -->
</head>
<body>
	<table border="2" align="center">
		<c:forEach items="${mlist}" var="member">
			<tr>
				<th>이름</th>
				<td>${member.member_name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${member.member_address}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${member.member_phone_number}</td>
			</tr>
			<tr>
				<th>현재포인트</th>
				<td>${member.member_point}</td>
			</tr>
			<c:forEach items="${plist}" var="product">
				<tr>
					<th>상품명</th>
					<td>${product.product_name}</td>
					<td>${product.product_sum_image}</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>${product.product_price}</td>
				</tr>
				<tr>
					<th>point 잔액</th>
					<td><input type="hidden" readonly="readonly"
						name="final_credit" class="final_credit"
						value="${member.member_point - product.product_price}">
						${member.member_point - product.product_price}</td>
					<td><c:choose>
							<c:when test="${member.member_point - product.product_price<= 0}">
								<span style="color: red;">충전이 필요합니다.</span>
								<a href='customer_point_management'>충전하기</a>
							</c:when>
							<c:otherwise>
								<span style="color: green;">결재 가능합니다.</span>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td><input type="button" value="결재"
						onclick="location.href='order_buy_final?member_point=${member.member_point - product.product_price}&member_number=${member.member_number}&seller_id=${product.seller_id}&product_number=${product.product_number}&product_price=${product.product_price}'">
					</td>
				</tr>

			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>
