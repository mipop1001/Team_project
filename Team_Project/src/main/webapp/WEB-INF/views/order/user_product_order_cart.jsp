<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="order_buy_final_cart" method="post">
<table align="center"  width="700px">
<caption> 결제 페이지 </caption>
<tr>
<th>구매자</th>
<td><hr>${dto2.member_name }<hr></td>
</tr>
<tr>
<th>주소</th>
<td><hr>${dto2.member_address }<hr></td>
</tr>
<tr>
<th>전화번호</th>
<td><hr>${dto2.member_phone_number }<hr></td>
</tr>
<tr>
<th>현재포인트</th>
<td><hr><fmt:formatNumber value="${dto2.member_point }" pattern="#,###" /> <hr></td>
</tr>
<tr>
<th>구매상품</th>
<td>
    <c:forEach items="${list}" var="i">
        <div style="display: flex; align-items: center;">
            <img src="product_sum_image/${i.product_sum_image}" width="100px" height="100px">
            <div style="margin-left: 10px;">
                ${i.product_name}<br>
                수량 : ${i.product_buy_amount}<br>
                금액 : <fmt:formatNumber value="${i.product_price}" pattern="#,###"/>
            </div>
        </div>
		<input type="hidden" name="product_numbers" value="${i.product_number}">
        <input type="hidden" name="product_Quantities" value="${i.product_buy_amount}">
        <input type="hidden" name="product_price" value="${i.product_price}">
    </c:forEach>
</td>
<td>
<c:forEach items="${list }" var="i">

</c:forEach>
</td>
<tr>
<th></th>
<td>
</td>
</tr>


<tr>
<th>구매 금액</th>
<td>
<hr>
<fmt:formatNumber value="${total }" pattern="#,###"/>
<hr>
</td>
</tr>

<tr>
	<th>결제 후 남는 <br> point 잔액</th>
					<td><input type="hidden" readonly="readonly"
						name="final_credit" class="final_credit"
						value="${dto2.member_point - total}">
						<fmt:formatNumber value="${dto2.member_point - total}" pattern="#,###" /> 
						</td>
					<td><c:choose>
							<c:when test="${dto2.member_point - total < 0}">
								<span style="color: red;">충전이 필요합니다.</span> <br>
								<a href='customer_point_management'>충전하기</a>
							</c:when>
							<c:otherwise>
								<span style="color: green;">결제 가능합니다.</span>
							</c:otherwise>
						</c:choose></td>
</tr>
<input type="hidden" name="member_number" value="${dto2.member_number}">
    <input type="hidden" name="total_price" value="${total }">
<tr>
<td colspan="2" style="text-align: center;">
<input type="button" value="결제" onclick="submitForm()">
</td>
</tr>
</table>
</form>
</body>
<script>
    function submitForm() {
        document.forms[0].submit();
    }
</script>
</html>