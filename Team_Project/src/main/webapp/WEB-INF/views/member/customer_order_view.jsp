<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>주문 조회</h2>
<table align="center" width="700px">
<tr>
<th>주문 번호</th>
<th>상품 명</th>
<th>판매자 명</th>
<th>수량</th>
<th>가격</th>
<th>총 가격</th>
<th>주문 날짜</th>
<th>배송 정보</th>
</tr>

<c:forEach items="${list }" var="i">
<tr>
<td>${i.sell_list_number }</td>
<td>${i.product_name }</td>
<td>${i.seller_name }</td>
<td>${i.product_sell_amount }</td>
<td>
<fmt:formatNumber value="${i.product_price }" pattern="#,###" />
</td>
<td>
<fmt:formatNumber value="${i.product_total_price }" pattern="#,###" />
</td>
<td>${i.product_sell_date }</td>
<td>${i.delivery_status }</td>
</tr>
</c:forEach>
</table>
</body>
</html>