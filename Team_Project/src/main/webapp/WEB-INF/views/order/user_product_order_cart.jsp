<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.purchase_button{
	height: 30px;
	color: #ffffff;
	margin-bottom: 5px;
	margin-top: 5px;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	width: 50px; 
	&:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.page_name {
	color: #777;
	align-content: center;
	margin-bottom: 30px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="order_buy_final_cart" method="post">
		<table align="center">
				<div class="page_name">
		<hr><H2>결제 페이지</H2>
	</div>
			<tr>
				<th>구매자</th>
				<td><hr>${dto2.member_name }</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><hr>${dto2.member_address }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><hr>${dto2.member_phone_number }</td>
			</tr>
			<tr>
				<th>현재포인트</th>
				<td><hr>
					<fmt:formatNumber value="${dto2.member_point }" pattern="#,###" />
					</td>
			</tr>
			<tr>
				<th>구매상품</th><hr>
				<td><hr><c:forEach items="${list}" var="i">
						<div style="display: flex; align-items: center;">
							<img src="product_sum_image/${i.product_sum_image}" width="100px"
								height="100px">
							<div style="margin-left: 10px;">
								${i.product_name}<br> 수량 : ${i.product_buy_amount}<br>
								금액 :
								<fmt:formatNumber value="${i.product_price}" pattern="#,###" />
							</div>
						</div>
						<input type="hidden" name="product_numbers"
							value="${i.product_number}">
						<input type="hidden" name="product_Quantities"
							value="${i.product_buy_amount}">
						<input type="hidden" name="product_price"
							value="${i.product_price}">
					</c:forEach></td>
				<td><c:forEach items="${list }" var="i">

					</c:forEach></td>
			<tr>
				<th></th>
				<td></td>
			</tr>


			<tr>
				<th>구매 금액</th>
				<td>
					<hr> <fmt:formatNumber value="${total }" pattern="#,###" />
					<hr>
				</td>
			</tr>

			<tr>
				<th>결제 후 잔액
				</th>
				<td><input type="hidden" readonly="readonly"
					name="final_credit" class="final_credit"
					value="${dto2.member_point - total}"> <fmt:formatNumber
						value="${dto2.member_point - total}" pattern="#,###" /></td>
				<td><c:choose>
						<c:when test="${dto2.member_point - total < 0}">
							<span style="color: red;">충전이 필요합니다.</span>
							<br>
							<a href='customer_point_management'>충전하기</a>
						</c:when>
						<c:otherwise>
							<span style="color: green;">결제 가능</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
				<input type="hidden" name="member_number" value="${dto2.member_number}">
				<input type="hidden" name="total_price" value="${total }">
			<tr>
				<td colspan="2" align="right"><hr><input type="button" class="purchase_button" value="결제" onclick="submitForm()"></td>
			</tr>
		</table>
	</form>
<script>
	function submitForm() {
		document.forms[0].submit();
		alert("마이페이지 포인트 업데이트를 누르시면\n포인트 정보가 새로고침 됩니다.");
	}
</script>
</body>
</html>