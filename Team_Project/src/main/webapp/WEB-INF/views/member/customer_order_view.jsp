<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('.refund_product').on('click', function () {
        var sellListNumber = $(this).data('sell-list-number');

        // AJAX 요청 보내기
        $.ajax({
            type: "POST",  // HTTP 요청 메서드 설정 (POST 또는 다른 메서드)
            url: "refund_product",  // 컨트롤러 URL 설정
            data: { "sell_list_number": sellListNumber },  // 요청 데이터 설정
            success: function (response) {
                // AJAX 요청 성공 시 실행할 코드
                // response 객체에 서버로부터의 응답 데이터가 포함될 수 있음
                if(response == "ok")
                	{
                alert("환불 요청에 성공했습니다.");
                	}
                else
                	{
                alert("이미 배송 출발한 상품입니다.");
                	}
            },
            error: function (xhr, status, error) {
                // AJAX 요청 실패 시 실행할 코드
                console.error("AJAX 요청 실패: " + error);
            }
        });
    });
});
</script>
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
<th>환불 요청</th>
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
    <c:choose>
        <c:when test="${i.delivery_status == '주문 접수 중' || i.delivery_status == '상품 준비 중' }">
            <td><button class="refund_product" data-sell-list-number="${i.sell_list_number}">환불 요청하기</button></td>
        </c:when>
        <c:when test="${i.delivery_status == '환불 요청 중' }">
        <td>환불 요청에 성공 했습니다.</td>
        </c:when>
        <c:otherwise>
            <td>환불 불가능한 상품 입니다.</td>
        </c:otherwise>
    </c:choose>
</tr>
</c:forEach>
</table>
</body>
</html>