<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.hidden {
	display: none;
}

.refund_status {
	position: relative;
	display: block;
}

.refund_status .tooltiptext {
	visibility: hidden; /* 이벤트가 없으면 툴팁 영역을 숨김 */
	width: 400px; /* 툴팁 영역의 넓이를 설정 */
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute; /* 절대 위치를 사용 */
	z-index: 1;
}

.refund_status:hover .tooltiptext {
	visibility: visible; /* hover 이벤트 발생시 영역을 보여줌 */
}

.page_name {
	color: #777;
	align-content: center;
	margin-bottom: 30px;
}

.refund_product {
	height: 35px;
	width: 110px;
	padding: 0 10px 0 10px;
	color: #ffffff;
	font-size: 16px;
	border: 1px solid #323437;
	background: #323437;
	text-align: center;
	font-weight: bold;
	line-height: 1.5;
	margin-left: 20px; 
    &:hover {
    background: rgb(77,77,77);
    color: #fff;}
}
.title_line{
text-align: center;
padding-bottom: 5px;
padding-top: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	
    $('.refund_product').on('click', function () {
        var sellListNumber = $(this).data('sell-list-number');
        var refund_check = confirm("환불 요청을 하시겠습니까?");
        var $button = $(this); // 클릭한 버튼을 변수에 저장

        // AJAX 요청 보내기
        if (refund_check) {
            $.ajax({
                type: "POST",
                url: "refund_product",
                data: { "sell_list_number": sellListNumber },
                success: function (response) {
                    if (response == "ok") {
                        alert("환불 요청에 성공했습니다.");
                        var $deliveryStatusCell = $button.closest('tr').find('.delivery_status');
                        $deliveryStatusCell.text("환불 요청 중");
                        var $buttonTd = $button.closest('.refund_status');
                        $buttonTd.html('환불 요청에 성공 했습니다.');
                    } else {
                        alert("이미 배송 출발한 상품입니다.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 실패: " + error);
                }
            });
        }
    });
});

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="page_name">
		<hr><H2>주문 조회</H2><hr>
	</div>
	<table align="center" width="1000px">
		<tr class="title_line">
			<th>주문 번호</th>
			<th>상품 명</th>
			<th>판매자 명</th>
			<th>수량</th>
			<th>가격</th>
			<th>총 가격</th>
			<th>주문 날짜</th>
			<th>배송 정보</th>
			<th class="refund_warning">환불 요청</th>
		</tr>

		<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.sell_list_number }</td>
				<td>${i.product_name }</td>
				<td>${i.seller_name }</td>
				<td>${i.product_sell_amount }</td>
				<td><fmt:formatNumber value="${i.product_price }"
						pattern="#,###" /></td>
				<td><fmt:formatNumber value="${i.product_total_price }"
						pattern="#,###" /></td>
				<td>${i.product_sell_date }</td>
				<td class="delivery_status">${i.delivery_status }</td>
				<c:choose>
					<c:when
						test="${i.delivery_status == '주문 접수 중' || i.delivery_status == '상품 준비 중' }">
						<td class="refund_status">
							<button class="refund_product"
								data-sell-list-number="${i.sell_list_number}">환불 요청하기</button> <span
							class="tooltiptext tooltip-left">주의: 환불 요청은 배송 상태가 '주문 접수
								중' 또는 '상품 준비 중'인 경우에만 가능합니다.</span>
						</td>
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